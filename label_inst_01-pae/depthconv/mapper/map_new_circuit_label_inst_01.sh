#!/usr/bin/env bash
# ============================================================================
# map_new_circuit.sh
#   回路(Verilog)を渡すと TechMapResult/<SET>/ に deepsyn 最適化された
#   AIG / 4-1-PAE / 4-LUT / 4-3-PAE のデータを一括生成する。
#   全ターゲットで {eblif/, verilog/} を出力する (opt/ 階層なし = 全て deepsyn 済み)。
#
# 使い方:
#   ./map_new_circuit.sh <SET> [--seq|--comb] [c1 c2 ...]
#     <SET>  : ベンチマークセット名 (例: ISCAS85)。入力は SubjectGraph/<SET>/<c>.v
#              (トップモジュール名は必ず top)
#     <c...> : 回路名(拡張子なし)。SubjectGraph/<SET>/<c>.v を読む。
#              ★省略すると SubjectGraph/<SET>/*.v の全回路を対象にする。
#     --seq  : 全回路を順序回路 (FFあり) として扱う (pa2pae_ob_only.py → 4-3-PAE_OBFF/)。
#     --comb : 全回路を組合せ回路として扱う (pa2pae_area.py → 4-3-PAE/)。
#
#   --seq も --comb も付けない場合は、回路ごとに FF の有無を自動判定する
#   (FF があれば 4-3-PAE_OBFF、無ければ 4-3-PAE)。MCNC のように組合せと順序が
#   混在するセットも、これで安全に一括処理できる。
#
# 例:
#   ./map_new_circuit.sh MCNC              # MCNC 全21回路。FF有無を自動判定
#   ./map_new_circuit.sh ISCAS85           # ISCAS85 全11回路 (全て組合せと判定される)
#   ./map_new_circuit.sh MCNC alu4 s298    # 指定2回路。alu4=組合せ, s298=順序 と自動判定
#   ./map_new_circuit.sh ISCAS89 --seq     # ISCAS89 全23回路を順序として強制
#
# 出力方針:
#   - 全ての出力は TechMapResult/<SET>/ 以下にまとめる。
#   - opt/ 階層は作らない (全ターゲット deepsyn 済みなので区別不要)。
#   - 各ターゲット直下に eblif/ と verilog/ のみ。中間 blif は残さない (全て /tmp)。
#   - 4-3-PAE の PAレベル eblif は TechMapResult/<SET>/PA/ に残す (PA削減後の状態)。
#   - 入力ディレクトリ SubjectGraph/ には一切書き込まない
#     (4-3-PAE ILP の入力 seed は TechMapResult/<SET>/AIG/eblif/ をそのまま使う)。
#
# 前提: yosys(ABC内蔵) / Python venv TECHMAP (gurobipy[要ライセンス] + networkx)
#       YosysScript/abc_deepsyn.scr, YosysScript/abc_deepsyn_lut.scr,
#       mylib/{41pae.lib, mycells.lib, 41pae.v, pae.v, 41pae_config_map.json},
#       PatternGraph/PA.xml, src/*.py
# ============================================================================
# ---- source 誤用ガード ----
# このスクリプトは ./map_new_circuit.sh のように「実行」する用。
# source (. や source を付けて読み込む) と、下の set -e / exit が
# 呼び出し元の対話シェルまで巻き込んで、ターミナルが閉じてしまう。
# source されたことを検出したら、警告して return で抜ける (シェルは殺さない)。
if [ -n "${ZSH_VERSION:-}" ]; then
  case "${ZSH_EVAL_CONTEXT:-}" in *:file*) _SOURCED=1 ;; *) _SOURCED=0 ;; esac
elif [ -n "${BASH_VERSION:-}" ]; then
  (return 0 2>/dev/null) && _SOURCED=1 || _SOURCED=0
else
  _SOURCED=0
fi
if [ "$_SOURCED" = 1 ]; then
  echo "!! source せずに ./map_new_circuit.sh のように実行してください" >&2
  echo "   (source すると set -e / exit で今のシェルが閉じてしまいます)" >&2
  return 1
fi

set -euo pipefail
cd "$(dirname "$0")"

# ---- 引数パース ----
# MODE: auto(既定, 回路ごとにFF判定) / seq(全て順序) / comb(全て組合せ)
MODE="auto"; SET=""; CIRCUITS=()
for a in "$@"; do
  case "$a" in
    --seq)  MODE="seq" ;;
    --comb) MODE="comb" ;;
    *) if [ -z "$SET" ]; then SET="$a"; else CIRCUITS+=("$a"); fi ;;
  esac
done
if [ -z "$SET" ]; then
  echo "usage: $0 <SET> [--seq|--comb] [c1 c2 ...]"; exit 1
fi

# ---- 回路名を省略したら SubjectGraph/<SET>/*.v の全回路を対象にする ----
if [ ${#CIRCUITS[@]} -eq 0 ]; then
  for f in "SubjectGraph/$SET"/*.v; do
    [ -f "$f" ] && CIRCUITS+=("$(basename "$f" .v)")
  done
  if [ ${#CIRCUITS[@]} -eq 0 ]; then
    echo "!! SubjectGraph/$SET/*.v が1つも無い"; exit 1
  fi
  echo "回路名の指定なし → SubjectGraph/$SET の全 ${#CIRCUITS[@]} 回路を対象にする"
fi

# ---- venv (Gurobi/networkx) ----
[ -f TECHMAP/bin/activate ] && source TECHMAP/bin/activate || true

# ---- 回路が順序回路 (FFあり) かを判定する ----
#   yosys で synth 後に DFF/ラッチ系セルが残るかで判断する。
#   ※ grep -q は早期終了で yosys を SIGPIPE 死させ pipefail が rc=141 を拾うので使わない。
#     grep -c で全出力を読み切り、マッチ数>0 で順序回路とする。
is_seq_circuit() {
  local n
  n=$(yosys -p "read_verilog $1; synth -flatten -top top; stat" 2>/dev/null \
        | grep -cE '\$_(DFF|SDFF|ADFF|DFFSR|DLATCH)' || true)
  [ "$n" -gt 0 ]
}

# ---- 出力ディレクトリ (AIG/4-1-PAE/LUT は共通。4-3-PAE系は回路ごとに作る) ----
#      入力ディレクトリ SubjectGraph/ には一切書き込まない
mkdir -p \
  "TechMapResult/$SET/AIG/eblif"      "TechMapResult/$SET/AIG/verilog" \
  "TechMapResult/$SET/4-1-PAE/eblif"  "TechMapResult/$SET/4-1-PAE/verilog" \
  "TechMapResult/$SET/LUT/eblif"      "TechMapResult/$SET/LUT/verilog" \
  "TechMapResult/$SET/PA"

for c in "${CIRCUITS[@]}"; do
  SRC="SubjectGraph/$SET/$c.v"
  [ -f "$SRC" ] || { echo "!! $SRC が無い"; continue; }
  echo "======== $c ========"

  # ---- この回路の 4-3-PAE 変換方式を決める ----
  case "$MODE" in
    seq)  PA2PAE="pa2pae_ob_only.py"; P43="4-3-PAE_OBFF"; KIND="順序(強制)" ;;
    comb) PA2PAE="pa2pae_area.py";    P43="4-3-PAE";      KIND="組合せ(強制)" ;;
    auto)
      if is_seq_circuit "$SRC"; then
        PA2PAE="pa2pae_ob_only.py"; P43="4-3-PAE_OBFF"; KIND="順序(自動判定)"
      else
        PA2PAE="pa2pae_area.py";    P43="4-3-PAE";      KIND="組合せ(自動判定)"
      fi ;;
  esac
  mkdir -p "TechMapResult/$SET/$P43/eblif" "TechMapResult/$SET/$P43/verilog"

  # STEP1: deepsyn AIG  (AIG/eblif がそのまま 4-3-PAE(ILP) の入力 seed になる)
  SEED="TechMapResult/$SET/AIG/eblif/${c}_aig.eblif"
  yosys -q -p "read_verilog $SRC" -p "synth -flatten -top top" \
    -p "dfflibmap -liberty mylib/mycells.lib" \
    -p "abc -g AND -script YosysScript/abc_deepsyn.scr" \
    -p "write_blif $SEED"
  yosys -q -p "read_blif $SEED" -p "write_verilog TechMapResult/$SET/AIG/verilog/${c}_aig.v"
  echo "  [AIG]     ok"

  # STEP2: 4-1-PAE  (blif は /tmp のみ → eblif[真理値表検証内蔵] + verilog[41pae.v挿入])
  yosys -q -p "read_verilog $SRC" -p "synth -flatten -top top" \
    -p "dfflibmap -liberty mylib/mycells.lib" \
    -p "abc -liberty mylib/41pae.lib -script YosysScript/abc_deepsyn.scr" \
    -p "write_blif /tmp/${c}_pae.blif"
  python3 src/yosys_pae2eblif.py "/tmp/${c}_pae.blif" \
          "TechMapResult/$SET/4-1-PAE/eblif/${c}_pae.eblif" >/dev/null
  yosys -q -p "read_blif TechMapResult/$SET/4-1-PAE/eblif/${c}_pae.eblif" -p "write_verilog /tmp/${c}_41_top.v"
  cat mylib/41pae.v "/tmp/${c}_41_top.v" > "TechMapResult/$SET/4-1-PAE/verilog/${c}_pae.v"
  echo "  [4-1-PAE] ok"

  # STEP3: 4-LUT  (blif は /tmp のみ → eblif + verilog)
  yosys -q -p "read_verilog $SRC" -p "synth -flatten -top top" \
    -p "dfflibmap -liberty mylib/mycells.lib" \
    -p "abc -lut 4 -script YosysScript/abc_deepsyn_lut.scr" \
    -p "write_blif /tmp/${c}_lut.blif"
  python3 src/yosys_lut2eblif.py "/tmp/${c}_lut.blif" \
          "TechMapResult/$SET/LUT/eblif/${c}_lut.eblif" >/dev/null
  yosys -q -p "read_blif TechMapResult/$SET/LUT/eblif/${c}_lut.eblif" -p "write_verilog TechMapResult/$SET/LUT/verilog/${c}_lut.v"
  echo "  [4-LUT]   ok"

  # STEP4: 4-3-PAE  (ILP; scr.py の commands_ilp をインライン実行。入力 = BEST_AIG seed)
  #   6段: remove_buf2 -> blif2xml -> main(PAマッチ) -> ilp_gurobi(被覆ILP)
  #        -> make_eblif(PAレベル) -> $PA2PAE(PA→PAE集約)
  python3 src/remove_buf2.py "$SEED" >/dev/null;               mv nobuf.blif "${c}_nobuf.blif"
  python3 src/blif2xml.py "${c}_nobuf.blif" >/dev/null;        mv subjectgraph.xml "subjectgraph_${c}.xml"
  python3 src/main.py "subjectgraph_${c}.xml" PatternGraph/PA.xml >/dev/null; mv match_result_name.json "match_result_${c}.json"
  python3 src/ilp_gurobi.py "match_result_${c}.json" "${c}.json" >/dev/null
  python3 src/make_eblif.py "subjectgraph_${c}.xml" PatternGraph/PA.xml "${c}.json" >/dev/null; mv mapped.eblif "${c}_pa.eblif"
  #   PAレベル eblif は --pa-out で ⑥ 自身に出させる。
  #   ⑤ make_eblif.py の出力 (${c}_pa.eblif) は PA を畳む前の状態なので保存しない。
  python3 "src/$PA2PAE" "${c}_pa.eblif" "${c}.eblif" \
          --pa-out "TechMapResult/$SET/PA/${c}_pa.eblif" >/dev/null
  cp "${c}.eblif"    "TechMapResult/$SET/$P43/eblif/${c}.eblif"
  yosys -q -p "read_blif TechMapResult/$SET/$P43/eblif/${c}.eblif" -p "write_verilog /tmp/${c}_43_top.v"
  cat mylib/pae.v "/tmp/${c}_43_top.v" > "TechMapResult/$SET/$P43/verilog/${c}.v"
  rm -f "${c}_nobuf.blif" "subjectgraph_${c}.xml" "match_result_${c}.json" "${c}.json" "${c}_pa.eblif" "${c}.eblif"
  echo "  [$P43] ok  ($KIND, PA2PAE=$PA2PAE)"
done
echo "完了: TechMapResult/$SET/{AIG,4-1-PAE,LUT,4-3-PAE|4-3-PAE_OBFF,PA}/{eblif,verilog}"

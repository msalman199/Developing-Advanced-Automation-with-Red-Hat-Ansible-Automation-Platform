#!/bin/bash
set -euo pipefail

run_and_time() {
  local playbook=$1
  local logfile=$2
  { /usr/bin/time -p ansible-playbook -i inventory.ini "$playbook" > /dev/null ; } 2> "$logfile"
  grep '^real' "$logfile" | awk '{print $2}'
}

echo "Running sequential baseline..."
SEQ_TIME=$(run_and_time compare-sequential.yml seq_raw.log)

echo "Running linear strategy..."
LIN_TIME=$(run_and_time compare-linear.yml lin_raw.log)

echo "Running free strategy..."
FREE_TIME=$(run_and_time compare-free.yml free_raw.log)

echo "=== PERFORMANCE COMPARISON RESULTS ===" | tee comparison_results.txt
echo "Sequential execution time: ${SEQ_TIME}s" | tee -a comparison_results.txt
echo "Linear execution time:     ${LIN_TIME}s" | tee -a comparison_results.txt
echo "Free execution time:       ${FREE_TIME}s" | tee -a comparison_results.txt

python3 - "$SEQ_TIME" "$LIN_TIME" "$FREE_TIME" << 'PYEOF' | tee -a comparison_results.txt
import sys
seq, lin, free = (float(x) for x in sys.argv[1:4])
lin_improvement = ((seq - lin) / seq) * 100
free_improvement = ((seq - free) / seq) * 100
print(f"Linear improvement over sequential: {lin_improvement:.2f}%")
print(f"Free strategy improvement over sequential: {free_improvement:.2f}%")
PYEOF

echo "=== END RESULTS ===" | tee -a comparison_results.txt

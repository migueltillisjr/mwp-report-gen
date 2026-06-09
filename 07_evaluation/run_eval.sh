#!/bin/bash
# Run the eval agent (Stage 7) using OpenCode CLI non-interactive mode
# This script invokes the eval agent to critically evaluate the final report against the rubric.
#
# Usage:
#   ./run_eval.sh                          # evaluates 06_final_polish/output/final_report.md (default)
#   ./run_eval.sh path/to/report.md        # evaluates the specified file

set -e

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
REPORT_FILE="${1:-06_final_polish/output/final_report.md}"

echo "🔍 Running Stage 7 — Evaluation..."
echo "   Project: $PROJECT_DIR"
echo "   Report:  $REPORT_FILE"
echo ""

cd "$PROJECT_DIR"

opencode run \
  --agent eval \
  "Read 07_evaluation/CONTEXT.md and follow its instructions exactly. Read the report at ${REPORT_FILE}, evaluate it against shared/references/RUBRIC.md and shared/references/REQUIREMENTS.md, answer all YES/NO verification questions, and write the evaluation to 07_evaluation/output/evaluation.md using the write tool."

echo ""
echo "✅ Evaluation complete. Check 07_evaluation/output/evaluation.md"

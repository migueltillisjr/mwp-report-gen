#!/bin/bash
# Run the report agent to build the report end-to-end.
# This script runs stages 1–6 via the writing agent, then delegates stages 7–8 to specialized agents.

set -e

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "📝 Running Report Builder..."
echo "   Project: $PROJECT_DIR"
echo ""

cd "$PROJECT_DIR"

# Activate virtual environment and load env vars
source .report/bin/activate;source .env;

# Stage 1–6: Build the report
echo "=== Stages 1–6: Building report ==="
opencode run \
  --agent report \
  "Build the report. Use APA citation style. Read shared/references/REQUIREMENTS.md and shared/references/RUBRIC.md first, then work through stages 1 through 6 ONLY. Stop after writing 06_final_polish/output/final_report.md. Do NOT attempt to run stages 7 or 8. Write output files to each stage's output/ directory."

echo ""
echo "=== Stage 7: Evaluation ==="
bash 07_evaluation/run_eval.sh

echo ""
echo "=== Stage 8: Revision Pass ==="
bash 08_revision_pass/run_revise.sh

echo ""
echo "=== Stage 9: Final Evaluation ==="
bash 07_evaluation/run_eval.sh 08_revision_pass/output/revised_report.md

echo ""
echo "✅ All stages complete."
echo "   Final report: 08_revision_pass/output/revised_report.md"

# PDF Export
echo ""
echo "📄 Generating PDF..."
python3 scripts/to_pdf.py

echo "   PDF: 08_revision_pass/output/revised_report.pdf"

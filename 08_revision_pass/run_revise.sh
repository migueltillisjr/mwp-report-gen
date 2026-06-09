#!/bin/bash
# Run the revise agent (Stage 8) using OpenCode CLI non-interactive mode
# This script invokes the revise agent to apply evaluation fixes and produce a revised report.

set -e

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "🔧 Running Stage 8 — Revision Pass..."
echo "   Project: $PROJECT_DIR"
echo ""

cd "$PROJECT_DIR"

opencode run \
  --agent revise \
  "Read 08_revision_pass/CONTEXT.md and follow its instructions exactly. Read the evaluation at 07_evaluation/output/evaluation.md, read the report at 06_final_polish/output/final_report.md, apply all recommended fixes, and write the complete revised report to 08_revision_pass/output/revised_report.md using the write tool."

echo ""
echo "✅ Revision pass complete. Check 08_revision_pass/output/revised_report.md"

# PDF Export
echo ""
echo "📄 Generating PDF..."
python3 scripts/to_pdf.py
echo "   PDF: 08_revision_pass/output/revised_report.pdf"

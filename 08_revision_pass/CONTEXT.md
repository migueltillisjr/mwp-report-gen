# Stage 8 — Revision Pass

Apply all fixes identified in the Stage 7 evaluation to produce an improved report.

## Input

Read `07_evaluation/output/evaluation.md` for the list of issues and recommendations.
Read `06_final_polish/output/final_report.md` for the current report.
Read `shared/references/REQUIREMENTS.md` and `shared/references/RUBRIC.md` for criteria.

## Process

1. Read the evaluation output and identify every criterion rated ⚠️ Approaching Competence or ❌ Not Evident.
2. For each non-Competent criterion, apply the recommended fix from the evaluation.
3. Preserve all sections that were rated ✅ Competent — do not weaken them.
4. Maintain professional tone, proper paragraph structure, and professional communication throughout.

## Output

**Use the `write` tool to save the revised report to `08_revision_pass/output/`.**

| File | Contents |
|------|----------|
| `revised_report.md` | The complete revised report ready to re-evaluate against the rubric |

## Run Versioning

On subsequent runs, append a unique run ID (timestamp) to the filename:
- First run: `revised_report.md`
- Subsequent runs: `revised_report_<YYYYMMDD_HHMMSS>.md`

Generate the timestamp using `bash`: `date +%Y%m%d_%H%M%S`

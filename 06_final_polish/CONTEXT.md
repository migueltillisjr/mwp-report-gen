# Stage 6 — Final Polish

Format, finalize citations/bibliography, and produce the finished report.

## Input

Read `05_revision/output/revised_draft.md` for the revised report.

## References

| File | Purpose |
|------|---------|
| `06_final_polish/references/AI_DEFENSE.md` | (Optional) Writing style requirements — if this file exists, read and apply these to rewrite the report so it sounds natural and human-written |
| `shared/references/TEMPLATE.md` | (Optional) Document template — if this file exists and has content, fit the final report into this template's structure |

## Process

1. Check if `06_final_polish/references/AI_DEFENSE.md` exists. If it does, read it and apply all of its requirements to rewrite the report. If it does not exist, skip this step and continue.
2. Check if `shared/references/TEMPLATE.md` exists and has content. If it does, restructure the report to fit within the template's format and sections.
3. Format per the required style guide.
4. Ensure all in-text citations remain intact and correctly placed.
5. Generate the bibliography/works cited page.
6. Produce the final version as a clean document.

## Output

Write the following to `06_final_polish/output/`:

| File | Contents |
|------|----------|
| `final_report.md` | The completed, naturally-written report ready for submission |

## Run Versioning

On subsequent runs, append a unique run ID (timestamp) to the filename:
- First run: `final_report.md`
- Subsequent runs: `final_report_<YYYYMMDD_HHMMSS>.md`

Generate the timestamp using `bash`: `date +%Y%m%d_%H%M%S`

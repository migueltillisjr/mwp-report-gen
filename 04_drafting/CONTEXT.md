# Stage 4 — Drafting

Write the report section by section, checking in with the user along the way.

## Input

Read `03_outline/output/outline.md` for the confirmed structure.

## Process

Write the report one section at a time. After each section:
- Show it to the user
- Ask for feedback or approval
- Move to the next section only after confirmation

## Output

Write the following to `04_drafting/output/`:

| File | Contents |
|------|----------|
| `draft.md` | The complete first draft of the report with all sections |

## Run Versioning

On subsequent runs, append a unique run ID (timestamp) to the filename:
- First run: `draft.md`
- Subsequent runs: `draft_<YYYYMMDD_HHMMSS>.md`

Generate the timestamp using `bash`: `date +%Y%m%d_%H%M%S`

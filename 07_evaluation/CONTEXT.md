# Stage 7 — Evaluation

Critically evaluate the final report against the assignment requirements and grading rubric. **Be harsh. Assume nothing passes unless you can point to specific text in the report that satisfies the rubric criterion.**

## Input

Read `06_final_polish/output/final_report.md` for the completed report.

## Process

1. Read `shared/references/REQUIREMENTS.md` and `shared/references/RUBRIC.md`.
2. The rubric defines the criteria. For **each** section in the rubric (every row in the table), do the following:
   - Quote or reference the specific passage in the report that addresses the criterion.
   - Compare that passage against the "Competent" column in the rubric.
   - If the passage does not **fully** meet the Competent standard, it is NOT Competent.
3. Assign ratings using emoji scoring: ✅ Competent, ⚠️ Approaching Competence, or ❌ Not Evident.

## Evaluation Procedure

For EACH criterion in `shared/references/RUBRIC.md`, answer YES/NO verification questions:

1. Read the "Competent" description for the criterion.
2. Find evidence in the report that satisfies it.
3. If evidence fully satisfies → ✅ Competent
4. If evidence partially satisfies (matches "Approaching Competence" column) → ⚠️ Approaching Competence
5. If no evidence found → ❌ Not Evident

**Do NOT give benefit of the doubt. If you cannot point to specific text, it does not pass.**

## Strict Rules

- If the rubric says the report needs N items and the report has fewer, it is NOT Competent.
- If the rubric requires sources and only placeholder templates exist, rate ❌ Not Evident.
- If the rubric requires a comparison and the report only describes items independently without explicit comparison language, rate ⚠️ Approaching Competence.
- If the rubric requires an explanation and the report only states a fact without explaining, rate ⚠️ Approaching Competence.

## Output

**Use the `write` tool to save to `07_evaluation/output/evaluation.md`.**

The output file MUST contain:

1. For each rubric criterion: the YES/NO verification check and the specific evidence (or lack thereof) found in the report.
2. A rating table with emoji scores:

```markdown
## Evaluation Results

| Section | Rating | Notes |
|---------|--------|-------|
| [criterion from rubric] | [✅/⚠️/❌] | [evidence or what's missing] |
| ... | ... | ... |

## Summary

| Passing (✅) | Needs Work (⚠️) | Failing (❌) |
|--------------|-----------------|--------------|
| [sections] | [sections] | [sections] |

## Recommendations

1. [Specific fix for first non-Competent item]
2. [Specific fix for second non-Competent item]
3. [etc.]
```

| File | Contents |
|------|----------|
| `evaluation.md` | Full evaluation with verification checks, emoji ratings, summary, and recommendations |

## Run Versioning

On subsequent runs, append a unique run ID (timestamp) to the filename:
- First run: `evaluation.md`
- Subsequent runs: `evaluation_<YYYYMMDD_HHMMSS>.md`

Generate the timestamp using `bash`: `date +%Y%m%d_%H%M%S`

**REMINDER: Use the `write` tool to create this file on disk. Do not just display in chat.**

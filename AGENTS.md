# Agents

This project uses three OpenCode agents orchestrated via shell scripts to generate, evaluate, and revise professional reports.

## Architecture

```
run_report.sh
├── report agent (stages 1–6)  →  writes report
├── eval agent (stage 7)       →  grades report against rubric
├── revise agent (stage 8)     →  applies fixes
└── eval agent (stage 9)       →  final grade on revised report
```

---

## Agent Definitions

All agent files live in `generate/.opencode/agents/`.

### 1. `report.md` — Report Writer

| Property | Value |
|----------|-------|
| Model | `amazon-bedrock/amazon.nova-pro-v1:0` |
| Temperature | 0.1 |
| Steps | 20 |
| Purpose | Write the report through stages 1–6 |

**Behavior:**
- Reads `shared/references/REQUIREMENTS.md` and `RUBRIC.md` before starting.
- Walks through a wizard: scope → research → outline → draft → revise → polish.
- Each stage reads the previous stage's `output/` and writes its own deliverables to disk.
- Stops after stage 6 when run non-interactively via `run_report.sh`.

**Tools enabled:** read, write, edit, bash, grep, glob, todowrite, webfetch, websearch

---

### 2. `eval.md` — Report Evaluator

| Property | Value |
|----------|-------|
| Model | `amazon-bedrock/anthropic.claude-sonnet-4-5-20250929-v1:0` |
| Temperature | 0.0 |
| Steps | 10 |
| Purpose | Critically grade the report against the rubric |

**Behavior:**
- Reads the rubric and requirements, then the report.
- Follows `07_evaluation/CONTEXT.md` for YES/NO verification questions per criterion.
- Assigns emoji ratings: ✅ Competent, ⚠️ Approaching Competence, ❌ Not Evident.
- Writes evaluation to `07_evaluation/output/evaluation.md`.

**Design choice:** Uses Claude (higher reasoning) with temperature 0 for strict, deterministic grading. Nova Pro was too lenient.

**Tools enabled:** read, write, bash, grep, glob

---

### 3. `revise.md` — Revision Agent

| Property | Value |
|----------|-------|
| Model | `amazon-bedrock/anthropic.claude-sonnet-4-5-20250929-v1:0` |
| Temperature | 0.2 |
| Steps | 15 |
| Purpose | Apply evaluation fixes to produce a passing report |

**Behavior:**
- Reads the evaluation output and identifies non-Competent criteria.
- Reads the current report from `06_final_polish/output/final_report.md`.
- Applies fixes systematically.
- Uses websearch/webfetch to find real professional sources when needed.
- Writes the complete revised report to `08_revision_pass/output/revised_report.md`.

**Tools enabled:** read, write, edit, bash, grep, glob, webfetch, websearch

---

## Orchestration

### `run_report.sh`

The main entry point. Runs the full pipeline:

1. Activates venv (`.ethics/bin/activate`) and loads `.env`
2. Runs `report` agent for stages 1–6 (report writing)
3. Runs `eval` agent for stage 7 (grading)
4. Runs `revise` agent for stage 8 (fixing)
5. Runs `eval` agent again for stage 9 (final grade on revised report)
6. Runs `scripts/to_pdf.py` for PDF export

### `07_evaluation/run_eval.sh [file]`

Standalone evaluation. Accepts an optional file path override:
```bash
./07_evaluation/run_eval.sh                              # default report
./07_evaluation/run_eval.sh 08_revision_pass/output/revised_report.md  # specific file
```

### `08_revision_pass/run_revise.sh`

Standalone revision pass.

### `clean.sh`

Removes all generated files from `*/output/` directories, keeping `.gitkeep` files.

---

## Stage I/O Contract

Each stage reads from the previous stage's output and writes its own:

| Stage | Input | Output |
|-------|-------|--------|
| 1. Topic & Scope | `shared/references/` | `01_topic_and_scope/output/scope.md` |
| 2. Research | `scope.md` | `sources.md`, `frameworks.md` |
| 3. Outline | `sources.md`, `frameworks.md` | `outline.md` |
| 4. Drafting | `outline.md` | `draft.md` |
| 5. Revision | `draft.md` | `revised_draft.md`, `revision_notes.md` |
| 6. Final Polish | `revised_draft.md` | `final_report.md` |
| 7. Evaluation | `final_report.md` | `evaluation.md` |
| 8. Revision Pass | `evaluation.md` + `final_report.md` | `revised_report.md` |

---

## Adding a New Agent

1. Create `generate/.opencode/agents/<name>.md` with YAML frontmatter (model, tools, temperature).
2. Write the system prompt in the markdown body.
3. Create a shell script to invoke it: `opencode run --agent <name> "prompt"`.
4. Wire it into `run_paper.sh` or run standalone.

## Model Selection Rationale

| Task | Model | Why |
|------|-------|-----|
| Writing | Nova Pro | Cost-effective, good enough for creative drafting |
| Evaluation | Claude Sonnet 4.5 | Needs precision and strict reasoning — Nova was too lenient |
| Revision | Claude Sonnet 4.5 | Needs to find real sources and apply nuanced fixes |

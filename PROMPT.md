# Report Generator — Project Setup

## What was done

0. Configure `.opencode/agents/*.md` to write a report

1. **Created a staged directory structure** for the report writing workflow. Each stage of the wizard has its own numbered folder:

1a. Turn all text STAGE/references/* into markdown

```
01_topic_and_scope/
02_research_and_sources/
03_outline/
04_drafting/
05_revision/
06_final_polish/
```

2. **Added a `CONTEXT.md` in each stage folder** containing that stage's full instructions, process steps, and a status checklist.

3. **Added a `references/` directory in each stage folder** for storing stage-relevant sources and materials.

4. **Refactored the agent file** (`.opencode/agents/report.md`) to remove inline stage details and instead point to the per-stage `CONTEXT.md` files. The agent reads the relevant file when entering a step.

5. Reference the respective stage context.md files as a column in the wizard steps.

6. For each stage reference each of the references in a table to tell the AI to use it, for the respective stage context.md file.

7. Ensure that the output/ directory stores results for each respective stage, and that stages' outputs are used as inputs for the next stage if applicable.

## How it works

- The agent (`report.md`) defines the overall wizard flow, rules, and intent routing.
- When the agent enters a step, it reads the corresponding `CONTEXT.md` for detailed instructions.
- Each stage folder holds its own context, references, and eventually drafts/outputs for that phase of the report.

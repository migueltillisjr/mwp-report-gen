# Stage 2 — Research & Sources

Gather key concepts, theories, and sources relevant to the topic.

## Input

Read `01_topic_and_scope/output/scope.md` for the chosen topic and scope.

## References

Check if `02_research_and_sources/references/` contains any files. If it does:
- If a file contains a list of URLs, follow each URL using `webfetch` and use the content as source material.
- If a file is a document (markdown, text, etc.), read it and use its content as source material.
- Prioritize these provided references over web-searched sources.

## Process

- Identify 3–5 key concepts, theories, or frameworks relevant to the topic.
- Suggest landmark texts, articles, or case studies to reference.
- Use web search to find additional relevant professional sources if needed.
- Incorporate any sources found in `02_research_and_sources/references/`.

## Output

Write the following to `02_research_and_sources/output/`:

| File | Contents |
|------|----------|
| `sources.md` | List of sources with author, title, year, and a one-line summary of relevance |
| `frameworks.md` | Summary of the key concepts and frameworks that apply, with key arguments from each |

## Run Versioning

On subsequent runs, append a unique run ID (timestamp) to the filename:
- First run: `sources.md`, `frameworks.md`
- Subsequent runs: `sources_<YYYYMMDD_HHMMSS>.md`, `frameworks_<YYYYMMDD_HHMMSS>.md`

Generate the timestamp using `bash`: `date +%Y%m%d_%H%M%S`

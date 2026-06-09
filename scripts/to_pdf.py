#!/usr/bin/env python3
"""Convert the revised paper from Markdown to PDF using fpdf2's write_html (pure Python)."""

import sys
from pathlib import Path

try:
    import markdown
    from fpdf import FPDF
    from fpdf.html import FontFace
except ImportError:
    print("Missing dependencies. Install with:")
    print("  pip install fpdf2 markdown")
    sys.exit(1)

PROJECT_DIR = Path(__file__).resolve().parent.parent
INPUT_FILE = PROJECT_DIR / "08_revision_pass" / "output" / "revised_report.md"
OUTPUT_FILE = PROJECT_DIR / "08_revision_pass" / "output" / "revised_report.pdf"

CSS_STYLE = """
body { font-family: Times; font-size: 12pt; }
h2 { font-size: 14pt; }
h3 { font-size: 13pt; }
h4 { font-size: 12pt; font-style: italic; }
"""


def main():
    if not INPUT_FILE.exists():
        print(f"Error: {INPUT_FILE} not found.")
        sys.exit(1)

    # Convert markdown to HTML
    md_content = INPUT_FILE.read_text(encoding="utf-8")

    # Replace Unicode characters that aren't supported by the built-in Times font
    replacements = {
        "\u2014": "--",   # em dash
        "\u2013": "-",    # en dash
        "\u2018": "'",    # left single quote
        "\u2019": "'",    # right single quote
        "\u201c": '"',    # left double quote
        "\u201d": '"',    # right double quote
        "\u2026": "...",  # ellipsis
        "\u2022": "*",    # bullet
        "\u00a0": " ",    # non-breaking space
    }
    for char, replacement in replacements.items():
        md_content = md_content.replace(char, replacement)

    html_content = markdown.markdown(md_content, extensions=["extra"])

    # Wrap in basic HTML structure
    full_html = f"""
    <h2>Ethics Paper on AI-Driven Hiring Systems</h2>
    {html_content}
    """

    # Remove the duplicate top-level heading if present
    full_html = full_html.replace("<h2>Ethics Paper on AI-Driven Hiring Systems</h2>\n<h2>Ethics Paper on AI-Driven Hiring Systems</h2>", "<h2>Ethics Paper on AI-Driven Hiring Systems</h2>")

    # Create PDF with margins set before adding page
    pdf = FPDF()
    pdf.set_margins(25, 25, 25)
    pdf.set_auto_page_break(auto=True, margin=25)
    pdf.add_page()
    pdf.set_font("Times", size=12)

    # Use fpdf2's built-in HTML renderer
    pdf.set_text_color(0, 0, 0)
    # Strip any <a> tags to avoid blue link colors — keep just the text
    import re
    html_content = re.sub(r'<a[^>]*>(.*?)</a>', r'\1', html_content)
    # Force all headings and links to black
    black = FontFace(color=(0, 0, 0))
    pdf.write_html(html_content, tag_styles={
        "h1": black,
        "h2": black,
        "h3": black,
        "h4": black,
        "h5": black,
        "h6": black,
        "a": black,
    })


    # Save
    pdf.output(str(OUTPUT_FILE))
    print(f"✅ PDF written to: {OUTPUT_FILE}")


if __name__ == "__main__":
    main()

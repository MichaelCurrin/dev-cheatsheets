# Convert

## HTML to Markdown

```sh
$ pip install markdown
```

```python
import markdown

markdown_value
html_value = markdown.markdown(markdown_value)
```

```python
import markdown

markdown.markdownFromFile(input="in.md", output='out.html')
```

## Render Markdown

Markdown to HTML.

```sh
$ pip install markdownify
```
```python
from markdownify import ATX, markdownify as md


BULLETS = "-*+"

html_value = "..."

md_value = md(html_value, heading_style=ATX, bullets=BULLETS)
```

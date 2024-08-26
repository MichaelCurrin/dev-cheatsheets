# IPython

## Markdown

Useful if you have result from a function call and you want to display it with formatting.

```python
from IPython.display import Markdown

Markdown(value)
```


## HTML

```python
from IPython.display import HTML

html = HTML(image_html)
```

Render the HTML:

```python
from IPython.display import display

display(html)
```

## Image

```python
from IPython.display import Image

Image(filename=image_path)
```

---
description: Handling colors in Python
---
# Colors


## Colour

[colour](https://pypi.org/project/colour/) on PyPI.

> Converts and manipulates common color representation (RGB, HSL, web, …)

This isn't about printing, just switching between formats.

```python
>>> from colour import Color
>>> c = Color("blue")
>>> c
<Color blue>

>>> c.hex
'#00f'
>>> c.hsl
(0.66..., 1.0, 0.5)
>>> c.rgb
(0.0, 0.0, 1.0)
```


## Colors

How to print colored text in Python

[ansicolors](https://pypi.org/project/ansicolors/)

> Add ANSI colors and decorations to your strings.

Examples from the docs.

```python
from colors import color

print(color('my string', fg='blue'))
print(color('some text', fg='red', bg='yellow', style='underline'))
```

As strings:

```python
'\x1b[34mmy string\x1b[0m'
'\x1b[31;43;4msome text\x1b[0m'
```

Named colors

```python
from colors import red, green, blue

print(red('This is red'))
print(green('This is green'))
print(blue('This is blue'))

print(red('red on blue', bg='blue'))
print(green('green on black', bg='black', style='underline'))
```

Using a partial.

```python
from functools import partial
from colors import color

important = partial(color, fg='red', style='bold+underline'))

print(important('this is very important!'))
```


Or without a library.

Based on [SO](https://stackoverflow.com/questions/287871/how-to-print-colored-text-in-terminal-in-python)

This might be better as a dataclass or enum.

```python
class color:

    END_C = '\033[0m'

    OK_BLUE = '\033[94m'
    OK_GREEN = '\033[92m'

    WARNING = '\033[93m'
    FAIL = '\033[91m'

    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

    HEADER = '\033[95m'


print(color.OK_BLUE, 'Hello, world', color.END_C)
```

As a function:

```python
def ok_blue(value):
    print(color.OK_BLUE, value, color.END_C)
```

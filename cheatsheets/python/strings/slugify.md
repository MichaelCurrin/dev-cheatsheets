---
title: Slugify

description: Convert text value to a slug - suitable for filenames and URLs
---

## Related

- [Unicode cheatsheet][] for Python encoding.

[Unicode cheatsheet]: {% link cheatsheets/python/strings/encoding/unicode.md %}


## Remove non-ASCII

Strip out non-ASCII characters like emojis and special language characters.

```python
value.encode("ascii", errors="replace").decode()
```

This converts from Unicode to ASCII, then back again, replacing characters with `?`.

e.g.

```python
'accent _ é smiley 😀'.encode("ascii", errors="replace").decode()
# 'accent _ ? smiley ?'
```


## Remove symbols

Replace all characters that are not alphanumeric with a dash. Adjacent characters will become a single dash.

```python
SLUG_PATTERN.sub(NEW_CHAR, TEXT)
```

e.g. Note how the Unicode emoji gets stripped out, but the accented character is kept.

```python
import re

PATTERN = re.compile(r"[\W_]+")
    
    
SLUG_PATTERN.sub('-', 'accent _ é smiley 😀')
'accent-é-smiley-'
```

e.g. Remove punctuation symbols.

```python
SLUG_PATTERN.sub('-', '!@#$%^& é 😀')
# '-é-'
```


## Remove non-ASCII and symbols

This combines the sections above.

It also strips out any dash characters on the ends of the result.

```python
import re

PATTERN = re.compile(r"[\W_]+")


def slugify(value):
    """
    Convert value to a slug - safe for URLs and filenames.

    Non-ASCII characters and symbols are replaced, so the result is only basic
    alphanumeric and hyphens.
    """
    value = value.encode("ascii", errors="replace").decode()
    value = SLUG_PATTERN.sub("-", value)

    return value.strip("-")
```


## Use packages

See old [SO](https://stackoverflow.com/questions/5574042/string-slugification-in-python) post.

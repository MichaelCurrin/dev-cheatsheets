# Slugify

Convert text to a slug.

## Related

- [Unicode cheatsheet][] for Python encoding.

[Unicode cheatsheet]: {% link cheatsheets/python/strings/encoding/unicode.md %}


## Basic

Strip out non-ASCII characters like emojis and special language characters.

Then replace all characters that are not alphanumeric with a hyphen. Adjacent characters will become a single dash.

You might want to add a bit to remove a leading or trailing dash.

```python
import re

PATTERN = re.compile(r"[\W_]+")


def slugify(value):
    value = value.encode("ascii", errors="replace").decode()

    return PATTERN.sub("-", value)
```


## Use packages

See old [SO](https://stackoverflow.com/questions/5574042/string-slugification-in-python) post.

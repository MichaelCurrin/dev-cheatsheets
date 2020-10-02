---
title: Code blocks
---

See also the [Jekyll Supported Languages] page.

[Jekyll Supported Languages]: {{ site.baseurl }}{% link cheatsheets/jekyll/code-blocks/supported-languages.md %}

## Language highlighting

	```python
	print("Hello, world!")
	```

```python
print("Hello, world!")
```

The short name works too. Note that outside of Github, other editing tools like an IDE or StackEdit might only support the long or the short form of a language.

	```py
	print("Hello, world!")
	```

```py
print("Hello, world!")
```

## Specific languages

Some valid references for language-specific styling that I use.

- `markdown` or `md`
	- The former shows better rendering in the GitHub editor view.
- `json`
- `json5`
	- Support comments without giving red errors when rendered.
- `python` or `py`
- `ruby` or `rb`
- `html`
- `javascript` or `js`
- `sh` or `bash` (or the less common `shell`)
- `diff`
- `liquid`
- `yaml` or `yml`
- `regex` or `re`
	- The former actually provide more/better highlighting when viewing the rendered content.
- `mk`, `make`, `Makefile` (or lowercase).
	- These all work, I haven't compared how well though.


## Examples

### Diff

	```diff
	- a
	+ b
	```

```diff
- a
+ b
```

### JSON

	```json
	{
	    "foo": "bar"
	}
	```

```json
{
    "foo": "bar"
}
```

With comments, use `json5` to avoid getting errors for invalid content on Github. Note some platforms like StackEdit don't recognized `json5` but is okay.

	```json5
	{
	    // This is a comment.
	    "foo": "bar"
	}
	```


```json5
{
    // This is a comment.
    "foo": "bar"
}
```

### Regex

	```re
	[a-f]+
	```

```re
[a-f]+
```

Note - from limited testing, `re` works but not `regex`.

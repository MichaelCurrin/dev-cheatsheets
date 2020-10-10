---
title: Common formatting
description: A reference for markdown basics you'll use daily
---


## Headings

```markdown
---
title: Header 1
---

Content

## Header 2

Content

### Header 3

Content
```


Alternative below - note there is no whitespace and no `#`.

```markdown
Header 1
===

Content

Header 2
---

Content
```


## Horizontal rule

```markdown
See the triple dash with white space before it.

---

More content here.
```


## Styling

### Bold

```markdown
**Bold**

__Bold alternative__
```

### Italics

```md
_Italics_
*Italtics alternative*
```

### Bold + Italics

```md
_**Nested styling**_
```

### Strikethrough

The following are equivalent, though GitHub's markdown editor and VS Code only shows a preview in the edit window for the latter (double).

```markdown
~Strikethrough~

~~Strikethrough~~
```

~Strikethrough~

~~Strikethrough~~

## Links

The target will be used for `href` attribute.

```markdown
[Label](target)
```

The target will be used for `src` attribute.

```markdown
![Label](target)
```


## Paragraph

If there are two paragraph lines with no break between, Markdown will show them on online. Therefore you can either add white space between, use a `<br>` tag, or use a double white space at the end of the line (not practical if your IDE trims whitespace).

```markdown
Line 1

Line 2

Line 3 and
continuation of line 3.
```


## Quote block

### Single line

```markdown
> Quote message.
```

> Quote message.

### Multi-line

Note that the line break rule from the previous section applies to quotes as below.

```md
> Multi-line quote.
>
> Note the empty line above.

> This quote
> actually appears on one line.
```

> Multi-line quote.
>
> Note the empty line above.

> This quote
> actually appears on one line.
>

### Nested

```markdown
> How to nest a quote.
> > Repeat the quote symbol.
```

> How to nest a quote.
> > Repeat the quote symbol.

### List

Quote a single bullet list from another source.

```markdown
> - Point A
> - Point B
> - Point C
```

Add multiple quotes as separate points.

```markdown
- > Point A
- > Point B
- > Point C
```

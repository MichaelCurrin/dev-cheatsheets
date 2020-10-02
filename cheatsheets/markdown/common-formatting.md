---
title: Common formatting
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


```markdown
**Bold**
__Bold alt__

_Italics_
*Italtics alt*

_**Nested styling**_
```

The following are equivalent, though GitHub's markdown editor and VS Code only shows a preview in the edit window for the latter (double).

```markdown
~Strikethrough~
~~Strikethrough~~
```


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


## Quotes

Single line.

```markdown
> Quote
```

Multi-line. Note that the line break rule from the previous section applies to quotes as below.

```markdown
> Multi-line quote.
>
> Note the empty line above.

> This quote
> actually appears on one line.
```

Nesting quotes.

```markdown
> How to nest a quote.
> > Repeat the quote symbol.
```

Quote a list of bullet points (from one source).

```markdown
> - Point A
> - Point B
> - Point C
```

Add quotes from multiple sources to separate bullet points.

```markdown
- > Point A
- > Point B
- > Point C
```

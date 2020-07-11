---
title: Regex
---

## Resources

https://regex101.com/


## Repeat

```re
\w{2}
\w{4}
\w{2,4}
```


## Insert

Note use of `$1` to keep the original text. Brackets seem to be needed for this to work.

Applied VS Code regex replace.

### Add character

Add header symbol before a number.

- Find: `\d`
- Replace with: `# $1`

### Add break tag

Insert `br` tag at the end of lines which are not headings or empty lines.

- Find: `(^[^#].+)`
- Replace with: `$1<br>`

## Modifiers

https://www.w3schools.com/jsref/jsref_regexp_m.asp


## Exclude

### Exclude characters

Use `^` inside `[]` to exclude. Note `a-z` will work and a `-` must be at the start of the end to match a literal `-`.

```re
[^\w-]
```

### Exclude words

Source [regextester](https://www.regextester.com/15)

```re
^((?!badword).)*$
```

```
badword
test      # match
one two   # match
abadwords
three     # match
```


## URLs

### Markdown URLs

| Pattern                | Description                  |
| ---------------------- | ---------------------------- |
| `\[.+\]\(.+\)`         | Internal and external paths. |
| `\[.+\]\(.+\)`         | Internal path.               |
| `\[.+\]\(/.+\)`        | Internal absolute path.      |
| `\[.+\]\(http.+\)`     | External URLs.               |
| `\[.+\]\(http[^s].+\)` | HTTP URL that is not secure. |

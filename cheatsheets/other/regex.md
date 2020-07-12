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

Source: [regextester](https://www.regextester.com/15)

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

Multiple exclusions:

```re
?!(foo|bar)

?!(http|[{#])
```


## URLs

### URL validation

#### Detailed

Source: [regexr.com/39nr7](https://regexr.com/39nr7)

This will match multiple URLs on a line.

```re
[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)
```

#### Simplified

I made this and tested in VS Code.

```re
https:\/\/[\w./#-]*
```

It does not match `?=` or trailing `/` or Jekyll `{{` URLs.

Add ` ` or `\s` or `\(` at the start to find URL in a certain context.



#### Security

Insecure URLs excluding localhost. Make secure. Using VS Code find and replace.

- Find:
    ```re
    http:\/\/(?!localhost)[\w./#-]*
    ```
- Replace:
    ```re
    $1s$2
    ```

### Markdown URLs

- Internal and external paths. Allows for empty target too - `()`.
    ```re
    \[.+\]\(.*\)
    ```
- Internal path
    ```re
    \[.+\]\((?!http).+\)
    ```
- Internal absolute path
    ```re
    \[.+\]\(/.+\)
    ```
- External URLs
    ```re
    \[.+\]\(http.+\)
    ```
- HTTP URL that is not secure
    ```re
    \[.+\]\(http[^s].+\)
    ```
- Internal path which is not a `#` ID reference or Jekyll link.
    ```re
    \[.+\]\((?!(http|[{#])).+\)
    ```

Note `www` without a protocol is also external but not considered here as I don't use that style.

#### Convert to markdown URL

Find an external URL and convert to `[]()` format, remove protocol and `www` in the label - using regex find and replace in VS Code.

Includes an optional trailing slash (if not matched, this gets left outside the pattern after the `()` part).

- Find:
    ```re
     (https:\/\/)(www\.)?([\w./-]+[\w-]+)(/?)
    ```
- Replace:
    ```re
     [$3]($1$2$3$4)
    ```

Note leading space. This could be remove for lines starting with URL.

Sample

- ` https://stackedit.io/` => ` [stackedit.io](https://stackedit.io/)`
- ` https://github.com/MichaelCurrin/nested-jekyll-menus` => ` [github.com/MichaelCurrin/nested-jekyll-menu](https://github.com/MichaelCurrin/nested-jekyll-menus`
- ` https://github.com/MichaelCurrin/nested-jekyll-menus/` => ` [github.com/MichaelCurrin/nested-jekyll-menu](https://github.com/MichaelCurrin/nested-jekyll-menus/`

This variation handles `#id` values.

- Find:
    ```re
     (https:\/\/)(www\.)?([\w./-]+[\w-]+)(#[\w-]*)?(/?)
    ```
- Replace:
    ```re
     [$3]($1$2$3$4$5)
    ```

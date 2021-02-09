# URLs

{% raw %}


## URL validation

### Detailed

Source: [regexr.com/39nr7](https://regexr.com/39nr7)

This will match multiple URLs on a line.

```re
[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)
```

### Simplified

I made this and tested in VS Code.

```re
https:\/\/[\w./#-]*
```

It does not match `?=` or trailing `/` or Jekyll `{{` URLs.

Add a space or `\s` or `\(` at the start to find URL in a certain context.

### Security

Insecure URLs excluding localhost. Make secure. Using VS Code find and replace.

- Find:
    ```re
    http:\/\/(?!localhost)[\w./#-]*
    ```
- Replace:
    ```re
    $1s$2
    ```


## Markdown URLs

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

### Convert to markdown URL

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

Sample:

- ` https://stackedit.io/` => ` [stackedit.io](https://stackedit.io/)`
- ` https://github.com/MichaelCurrin/nested-jekyll-menus` => ` [github.com/MichaelCurrin/nested-jekyll-menu](https://github.com/MichaelCurrin/nested-jekyll-menus`
- ` https://github.com/MichaelCurrin/nested-jekyll-menus/` => ` [github.com/MichaelCurrin/nested-jekyll-menu](https://github.com/MichaelCurrin/nested-jekyll-menus/`

This variation handles `#` ID values.

- Find:
    ```re
     (https:\/\/)(www\.)?([\w./-]+[\w-]+)(#[\w-]*)?(/?)
    ```
- Replace:
    ```re
     [$3]($1$2$3$4$5)
    ```

{% endraw %}

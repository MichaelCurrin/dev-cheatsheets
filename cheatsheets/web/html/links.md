# Links


## Open in new tab

Use `target="_blank"`.

You can also set `rel` to remove the referrer and access to `window.opener`.

e.g.

```html
<a href="http://example.com" target="_blank" rel="noreferrer noopener"
>
```

Docs:

- [noopener](https://developer.mozilla.org/en-US/docs/Web/HTML/Link_types/noopener)
    > This is especially useful when opening untrusted links, in order to ensure they cannot tamper with the originating document via the `Window.opener` property...
- [noreferrer](https://developer.mozilla.org/en-US/docs/Web/HTML/Link_types/noreferrer)
    > ... to omit the Referer header and otherwise leak no referrer information

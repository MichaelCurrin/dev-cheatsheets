---
title: Links
description: Guide to creating links to pages using HTML or markdown
---

## a tag

- [HTML `<a>` Tag](https://www.w3schools.com/tags/tag_a.asp) on W3 Schools.


## Target attribute

- [Target attribute](https://www.w3schools.com/tags/att_a_target.asp) on W3 Schools.

```html
<a href="#" target="_blank"></a>
```

Allowed values:

- `_blank` - Opens the linked document in a **new** window or tab
- `_self` - Opens the linked document in the **same** frame as it was clicked (this is the **default**)
- `_parent` - Opens the linked document in the **parent** frame
- `_top` - Opens the linked document in the **full body** of the window
- `framename` -	Opens the linked document in the **named iframe**


## Open in a new tab

When a user clicks on a click, for the browser to open in a new tab.

### Syntax

On the anchor tag, set `target="_blank"`. 

You can also set `rel` to remove the referrer and access to `window.opener`.

### Example

```html
<a href="http://example.com" target="_blank" rel="noreferrer noopener">
    Link text
</a>
```

### Info

- [noopener](https://developer.mozilla.org/en-US/docs/Web/HTML/Link_types/noopener)
    > This is especially useful when opening untrusted links, in order to ensure they cannot tamper with the originating document via the `Window.opener` property...
- [noreferrer](https://developer.mozilla.org/en-US/docs/Web/HTML/Link_types/noreferrer)
    > ... to omit the Referer header and otherwise leak no referrer information

In Kramdown in Jekyll:

```markdown
[Alt text](https://example.com){:target="_blank"}
```

### When to use this

When should you open in a new tab? 

Don't do it for internal links. 

You can do it for internal links, but you may surprise the user. 

Rather let then control-click or right-click and open new tab. 

There's a risk they'll navigate away and never come back, but at least you haven't opened a new tab for them unexpectly which can be annoying.

If you do use this for external links, add some kind of arrow signifier so they know a new tab will be opened. I can't find a suitable emoji but you can find an icon on FontAwesome.

---
title: IFrame
description: The Inline Frame element
---

[iframe](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe) on MDN docs.

> The `<iframe>` HTML element represents a nested browsing context, embedding another HTML page into the current one.

> Each embedded browsing context has its own **session history** and **document**. 
> 
> The browsing context that embeds the others is called the **parent browsing context**. 
> 
> The **topmost** browsing context — the one with no parent — is usually the browser window, represented by the `Window` object.


## Example

### Map

```html
<style>
  iframe {
    border: 1px solid black;
    width: 100%;
  }

  .output {
      background: #eee;
  }
</style>

<iframe id="inlineFrameExample"
    title="Inline Frame Example"
    width="300"
    height="200"
    src="https://www.openstreetmap.org/export/embed.html?bbox=-0.004017949104309083%2C51.47612752641776%2C0.00030577182769775396%2C51.478569861898606&layer=mapnik">
</iframe>
```

### Avo

With title for accessibilty.

```html
<iframe title="Wikipedia page for Avocados" src="https://en.wikipedia.org/wiki/Avocado"></iframe>
```

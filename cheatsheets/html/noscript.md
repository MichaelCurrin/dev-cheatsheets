# Noscript

When JavaScript is disabled by the user, or by an adblocker or if the JS is not compatible in a browser, it is a good idea to have a fallback. The noscript HTML tag can be used to show a message. Especially if the site looks like a blank page without JS.

Previously only in the body, it now also works in the head but there it must contain links etc. and not content.

e.g.

```html
<noscript>
    This site requires JavaScript.
</noscript>
```

Or

```html
<noscript>
    This site is unsupported on your browser. Please enable JavaScript, turn off adblocker for this domain or switch to a different browser.
</noscript>
```

## Resources 

- https://webdesign.tutsplus.com/tutorials/quick-tip-dont-forget-the-noscript-element--cms-25498
- https://www.w3schools.com/TAGs/tag_noscript.asp
- https://developer.mozilla.org/en-US/docs/Web/HTML/Element/noscript

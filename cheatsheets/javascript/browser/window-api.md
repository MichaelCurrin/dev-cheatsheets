# Window API


## Resources

- [Window](https://developer.mozilla.org/en-US/docs/Web/API/Window) in the Mozilla docs.
- [Window Object](https://www.w3schools.com/jsref/obj_window.asp) on W3 schools.


## Open

See [Window.open](https://developer.mozilla.org/en-US/docs/Web/API/Window/open) in Mozilla docs.

### Syntax

This will open a new tab in the same window - first going to `about:blank` and then to the target URL.

```javascript
window.open(url, windowName, [windowFeatures]);
```

e.g.

```javascript
let windowObjectRef
windowObjectRef = window.open("https://michaelcurrin.github.io/dev-cheatsheets/", "myWindow");
```

Pass features like this:

```javascript
window.open(url, windowName, "resizable,scrollbars,status")

const windowFeatures = "menubar=yes,location=yes,resizable=yes,scrollbars=yes,status=yes"
window.open(url, windowName, windowFeatures)
```


## Example

```javascript
const windowObjectRefs = {};

function nav(href, windowName) {
  let ref = windowObjectRefs[windowName];

  if (!ref || ref.closed) {
    ref = window.open(href, windowName);
    windowObjectRefs[windowName] = ref;
  } else {
    ref.focus();
  }
}

const url = ""https://michaelcurrin.github.io/dev-cheatsheets/""
const windowName = "DevCheatsheets"

nav(url, windowName)
```

Use it in HTML. Note using the standard `target` field.

```html
<a href="https://www.google.com/search?q=dragon" target="GoogleSearch"
    onclick="nav(this.href, this.target); return false;">
    Google
</a>
```

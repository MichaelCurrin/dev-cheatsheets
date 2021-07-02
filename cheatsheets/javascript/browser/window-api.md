---
title: Window API
description: Using Window object in the browser
---


## Resources

- [Window](https://developer.mozilla.org/en-US/docs/Web/API/Window) in the Mozilla docs.
- [Window Object](https://www.w3schools.com/jsref/obj_window.asp) on W3 Schools.


## Open

See [Window.open](https://developer.mozilla.org/en-US/docs/Web/API/Window/open) in Mozilla docs.

That doc also recommends using a new tab link icon next to a standard link, so you can give the user the option between the same or different window. There are even icons provided (very old-fashioned). Though, that is standard `a` tag behavior and unrelated to `open`.

### Syntax

This will open a new tab in the same window - first going to `about:blank` and then to the target URL. The window will be autofocused (it is also confusing to the user if the window is opened and not focused.

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

function nav(url, windowName) {
  let ref = windowObjectRefs[windowName];

  if (!ref || ref.closed) {
    ref = window.open(url, windowName);
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


## Reference details

When you run `open`, you get a reference to the window.

You can focus it with

```javascript
ref.focus()
```

Close it and check closed status.

```javascript
ref.close()
ref.closed()
// true
```

If the URL is on the _same_ domain, you can do standard actions on it.

e.g.

```javascript
ref.console.log('Hello')
```

If not, you'll get permissions error.

```
DOMException: Permission denied to access property "console" on cross-origin object
```

This limitation is covered in the docs.

_A script loaded in a window (or frame) from a distinct origin (domain name) cannot get nor set properties of another window (or frame) or the properties of any of its HTML objects coming from another distinct origin (domain name)._

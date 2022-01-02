---
title: Navigation 
description: Reload a page or redirect to another page
---

## Related

- [Window API][] cheatsheet

[Window API]: {% link cheatsheets/javascript/browser/window-api.md %}


## Resources

- [Assign][] in Mozilla docs
- [Window.open][] in Mozilla docs.

[Assign]: https://developer.mozilla.org/en-US/docs/Web/API/Location/assign
[Window.open]: https://developer.mozilla.org/en-US/docs/Web/API/Window/open


## Reload

```javascript 
window.location.reload(false)
```

The argument is for a full reload:

- `false` - use cached HTML page 
- `true` -  full reload (hard refresh).


## Redirect 

Source [W3 Schools](https://www.w3schools.com/howto/howto_js_redirect_webpage.asp)

### Mouse click

Simulate a mouse click that was driven by a user.

```javascript 
const url = "https://example.com";
window.location.href = url;
```

### Assign

See [Assign][] docs.

This method will load and display the document at the URL specified. 

The user can then still navigate back by pressing the "back" button. 

```javascript
const url = "https://example.com";
window.location.assign(url);
```

### HTTP redirect 

Simulate an HTTP redirect that was driven by the page such as a 301 redirect.

```javascript 
const url = "https://example.com";
window.location.replace(url);
```

Using `replace` also removes the old URL from the history, so you _cannot_ click the Back btton.


## Open

Open a new tab or window. Or navigate within a tab that was opened using this method.

The MDN [Window.open][] doc also recommends using a new tab link icon next to a standard link, so you can give the user the option between the same or different window. There are even icons provided (very old-fashioned). Though, that is standard `a` tag behavior and unrelated to `open`.

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

### Example

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

### Reference details

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


## Examples with click triggers

How to use reload, assign, etc. on a page with a click trigger.

### Plain HTML

```html
<html>
<head>
    <script>
      function load() {
        const url = "https://example.com"
        window.location.assign(url)
      }
    </script>
</head>
<body>
    <input type="button" value="Load new document" onclick="load()">
</body>
</html> 
```

### React

```jsx
function load() {
  const url = "https://example.com"
  window.location.assign(url);
}

function Button() { 
  return (
    <>
      <button onClick={load}>
        Load new document
      </button>
    </>
  );
}

export default Button;
```

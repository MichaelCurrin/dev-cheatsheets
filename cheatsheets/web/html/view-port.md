# View port

Reset the view port to make the site look good on all devices.

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

A more advanced form:

```html
<meta name="viewport"
      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
```

- Controls the page's dimensions and scaling.
- The `width=device-width` part sets the width of the page to follow the screen-width of the device.
- The `initial-scale=1.0`  part sets the initial zoom level when the page is first loaded by the browser.

See example with and without the tag on this [page](https://www.w3schools.com/tags/tag_meta.asp).

Without the tag, your text and images will look small on a mobile device, like when you select Desktop mode on your phone's browser.

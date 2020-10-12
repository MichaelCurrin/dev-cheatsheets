---
title: Favicon
---

Override favicon default. Some sources use `/myicon.png` and some `https://example.com/myicon.png`.


## ICO

Use the `.ico` format - which is not just a rename PNG file.

```html
<link rel="shortcut icon" href="http://example.com/favicon.ico" />
```

From [Favicon generator](https://www.favicon-generator.org/) and other sources. The `type` attribute was not included in other source I found.

```html
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">

<link rel="icon" href="/favicon.ico" type="image/x-icon">
```

From [source](https://www.html.am/html-codes/image-codes/html-favicon-code.cfm):

> Also, although this example uses the .ico extension, you could use other image formats, such as .png. .gif, .jpeg, and even animated GIFs. However, the .ico format has had wide acceptance from browsers for quite some time and is a common format when using favicons.
> 
> Favicons can be 16x16, 32x32, 48x48, or 64x64 pixels in size, and 8-bit, 24-bit, or 32-bit in color depth


From [CSS tricks](https://css-tricks.com/favicon-quiz/)

> favicon.ico. And just to make sure: this is not a PNG renamed to favicon.ico. Although some browsers are easygoing enough to forgive this mistake, ICO is a different format, one that supports multiple versions of an image.


## PNG

From [W3 Schools](https://www.w3schools.com/tags/att_link_sizes.asp)

```html
<link rel="icon" href="/favicon.png" type="image/png">
```

This style hasn't changed since [2005](https://www.w3.org/2005/10/howto-favicon). They explain there that this is preferred over implied favicon.

```html
<link rel="icon" href="http://example.com/myicon.png" type="image/png">
```


## SVG

```html
<link rel="icon" href="icon.svg" type="image/svg+xml">
```


## Apple icon PNG

```html
<link rel="apple-touch-icon" href="icon.png">
```

From [source](https://www.html.am/html-codes/image-codes/html-favicon-code.cfm).

> Apple devices with the iOS operating system version 1.1.3 or later (such as the iPod Touch, iPhone, and iPad) support the ability for you to provide a custom icon to be displayed on users' Home screen when they use the Web Clip feature (called Add to Home Screen within Mobile Safari).
>
> Some Android devices also support this feature.

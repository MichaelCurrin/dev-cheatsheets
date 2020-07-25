---
title: Images
---


## Optimizing image loading

Code snippets and references to read more.

See [The “Blur Up” Technique for Loading Background Images](https://css-tricks.com/the-blur-up-technique-for-loading-background-images/) on CSS tricks

Resources:

- [The Complete Guide to Lazy Loading Images](https://css-tricks.com/the-complete-guide-to-lazy-loading-images/) - using JS to lazy load main and background images
- [A Native Lazy Load for the Web Platform](https://css-tricks.com/a-native-lazy-load-for-the-web-platform/)
- [Tips for rolling your own lazy loading](https://css-tricks.com/tips-for-rolling-your-own-lazy-loading/) (2019 article)

Native lazy loading is new and already available in Chrome 76 from 2019 and is supported in Chromium-based and Firefox browsers from 2020. [source](https://web.dev/native-lazy-loading/)

```html
<img src="image.png" loading="lazy" alt="…" width="200" height="200">

<iframe src="https://example.com" loading="lazy"></iframe>
```

Here are the supported values for the `loading` attribute:

- `auto`: Default lazy-loading behavior of the browser, which is the same as not including the attribute.
- `lazy`: Defer loading of the resource until it reaches a calculated distance from the viewport.
- `eager`: Load the resource immediately, regardless of where it's located on the page.

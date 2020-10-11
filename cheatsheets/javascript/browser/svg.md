---
title: SVG
---

## Change color using JS

### Inline SVG

[source](https://stackoverflow.com/questions/9872947/changing-svg-image-color-with-javascript)

```xml
<svg id="svg1" xmlns="https://www.w3.org/2000/svg"
  style="width: 3.5in; height: 1in">
    <circle id="circle1" r="30" cx="34" cy="34"
      style="fill: red; stroke: blue; stroke-width: 2"/>
</svg>

<!-- CSS should be used here instead of editing style. -->
<button onclick="circle1.style.fill='yellow';">Click to change to yellow</button>
```

### Linked SVG

Note: styling on the object element does not affect the value inside. An iframe can be used too.

```html
<object id="my-svg" data="image.svg" type="image/svg+xml"></object>
```

```javascript
let object = document.getElementById('my-svg');
svg = object.getSVGDocument();
svg.getElementsByTagName('g')[0].setAttribute('fill', '#fff');
```

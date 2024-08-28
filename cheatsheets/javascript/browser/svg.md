# SVG

## Change color using JS

### Inline SVG (`svg` element)

Change using `onclick` to set an attribute or class.

[source](https://stackoverflow.com/questions/9872947/changing-svg-image-color-with-javascript)

```xml
<svg id="svg1" xmlns="https://www.w3.org/2000/svg"
  style="width: 3.5in; height: 1in">
    <circle id="circle1" r="30" cx="34" cy="34"
      style="fill: red; stroke: blue; stroke-width: 2"/>
</svg>
```

```xml
<button onclick="circle1.style.fill='yellow';">
    Click to change to yellow
</button>
```

Or better, using a CSS class:

```xml
<button onclick="circle1.classList.toggle('yellow-fill');">
    Click to change to yellow
</button>
```

```css
circle {
  fill: blue; 
}

.yellow-fill {
  fill: yellow; 
}
```

### Linked SVG (`object` element with reference)

When you embed an SVG using `<object>`, the SVG is treated as a separate document. The `contentDocument` property allows you to access and manipulate this embedded document's DOM (and is safer and more widely used than `getSVGDocument()`).

Set this using JS.

```html
<object id="my-svg" data="image.svg" type="image/svg+xml" onclick="changeFillColor"></object>
```

```javascript
function changeFillColor() {
  const object = document.getElementById('my-svg');
  const svg = object.contentDocument; 
  const group = svg.getElementsByTagName('g')[0];
  
  group.classList.toggle('white-fill');
}
```

```css
.white-fill {
  fill: #fff; 
}
```

Note: changing `styling` on the `object` element does not affect the value inside it. 

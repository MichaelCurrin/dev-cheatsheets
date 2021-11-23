# Boxes


## Box sizing

- [box-sizing](https://developer.mozilla.org/en-US/docs/Web/CSS/box-sizing) on MDN docs.
    > The `box-sizing` CSS property sets how the total width and height of an element is calculated.

```css
box-sizing: content-box;
width: 100%;
```

Add border, but element goes outside of the parent.

```css
box-sizing: content-box;
width: 100%;
border: solid #5B6DCD 10px;
padding: 5px;
```

Keep element inside parent.

```css
box-sizing: border-box;
width: 100%;
border: solid #5B6DCD 10px;
padding: 5px;
```


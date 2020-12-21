# Styling


## Navigation bar

A full-width navbar that sticks to the top of the page when you scroll.

```css
nav.navbar {
  position: fixed;
  top: 0;
  width: 100%;
}
```

See also [Bulma navbar](https://bulma.io/documentation/components/navbar/) documentation.

## Footer

Sticky footer. Note that if your footer is not a navbar, you cannot use the styling above.

Note if your footer is tall, it may not look good fixed to the bottom of the screen especially on mobile.

```css
footer {
  position: fixed;
  bottom: 0;
  width: 100%;
}
```

See more approaches [here](https://github.com/jgthms/bulma/issues/47).

## Background images

### Cover image

Set a full-width image at the top of your page, possibly behind. The no-repeat part is useful to stop the image from repeating - the default behavior.

```css
el {
    background-image: url(...);
    background-repeat: no-repeat;
    background-size: 100% auto;
}
```

Setting `background-size: cover` could also work. The repeat might not be needed.

Or use:

```css
/* #root {
    background-image: linear-gradient(to bottom right, #222, #eee);
    background-repeat: no-repeat;
    background-position: center center;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
} */
```

Position could be `center top`.

### Resources

Tutorials:

- [background](https://www.w3schools.com/cssref/css3_pr_background.asp)
- [background-size](https://www.w3schools.com/cssref/css3_pr_background-size.asp) including possible values.


## Button

- [Bess CSS Button Generator](https://www.bestcssbuttongenerator.com/)

Some useful styling - in particular for a DocsifyJS site.

```css
.myButton {
    background-color: var(--theme-color);
    color: white;
    /* Slightly larger */
    font-size: 1.0em;
    /* Round the edges */
    border-radius: 8px;
    padding: 6px 12px;
    /* Change cursor on hover */
    cursor: pointer;
}
.myButton:hover {
    filter: brightness(110%)
}
/* Shift the button down on click */
.myButton:active {
    position:relative;
    top: 2px;
}
```

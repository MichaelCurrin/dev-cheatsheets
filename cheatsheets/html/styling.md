# Styling

## Navbar

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

Optionally add:

```css
    background-position: center top;
    background-attachment: fixed;
```

### Resources

Tutorials:

- [background](https://www.w3schools.com/cssref/css3_pr_background.asp)
- [background-size](https://www.w3schools.com/cssref/css3_pr_background-size.asp) including possible values.

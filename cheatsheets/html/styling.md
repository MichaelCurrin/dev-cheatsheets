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

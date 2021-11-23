# ::before and ::after

See [::before](https://developer.mozilla.org/en-US/docs/Web/CSS/::before) in the MDN docs.

> In CSS, ::before creates a pseudo-element that is the first child of the selected element. It is often used to add cosmetic content to an element with the content property. It is inline by default.


## Syntax

```
/* CSS3 syntax */
::before

/* CSS2 syntax */
:before
```

e.g.

```css
el::before {
}
```



## Example

### Heart

```css
/* Add a heart before links */
a::before {
  content: "♥";
}
```

### Quotes

HTML

```html
<q>Some quotes</q>, he said, <q>are better than none.</q>
```

CSS

```css
q::before {
  content: "«";
  color: blue;
}

q::after {
  content: "»";
  color: red;
}
```


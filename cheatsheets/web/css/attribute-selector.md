# Attribute selector

See [Attribute selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/Attribute_selectors) in the docs.


## Attribute is set

```css
/* <a> elements with a title attribute */
a[title] {
  color: purple;
}
```

Disabled buttons.

```css
button[disabled] {
}
```

Required fields.

```css
input[required] {
}
```


All divs with a `lang` attribute are bold. 

```css
div[lang] {
  font-weight: bold;
}
```

All divs **without** a `lang` attribute are italicized.

```css
div:not([lang]) {
  font-style: italic;
}
```


## Text match

```css
/* <a> elements with an href matching "https://example.org" */
a[href="https://example.org"] {
  color: green;
}
```

```css
/* <a> elements with an href containing "example" */
a[href*="example"] {
  font-size: 2em;
}
```

```css
/* <a> elements with an href ending ".org" */
a[href$=".org"] {
  font-style: italic;
}
```

```css
/* <a> elements whose class attribute contains the word "logo" */
a[class~="logo"] {
  padding: 2px;
}
```

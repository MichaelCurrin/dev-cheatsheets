# Fonts

## Basic

From [W3 CSS Font](https://www.w3schools.com/css/css_font.asp) tutorial.

```css
p {
    font-family: "Times New Roman", Times, serif;
}

p.italic {
    font-style: italic;
}
```

## Weight

```css
p.thick {
    font-weight: bold;
}
```


## Size

### Font size

```css
p {
    font-size: 40px;
}
```

e.g.

- `40px`
- `100%`
- `larger`
-  `2.5em`


For a button:

```css
button.btn-large {
  font-size: larger;
}
```

### Font size adjust

```css
p {
    font-size-adjust: 1;
}
```

e.g.

- `0.5` - this seemeded close to default with no styling set.
- `1`
- `2`


## Web font

For example, the Poppins by Google.

- [Poppins page](https://fonts.google.com/specimen/Poppins?selection.family=Poppins) - snippets below are generated from here.
- [Poppins CDN URL - [fonts.googleapis.com/css2?family=Poppins:wght@700&display=swap](https://fonts.googleapis.com/css2?family=Poppins:wght@700&display=swap)

### Link tag

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@700&display=swap" rel="stylesheet"> 
```

### Import

```html
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@700&display=swap');
</style> 
```

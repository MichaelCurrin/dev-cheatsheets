---
title: CSS
icon: css3
---

## Github Pages CSS

If you have a Github Pages site of HTML files that do not use Jekyll, you can still prettify them using this:

```html
<link rel="stylesheet" href="assets/css/style.css">
```

Note the URL here is relative to the current page.

If you are adding styling to a subpage, you can use a prefix:

- `/repo-name/` - make it absolute using
- `../` - make it relative

## Font

[source](https://www.w3schools.com/css/css_font.asp)

```css
p {
    font-family: "Times New Roman", Times, serif;
}

p.italic {
    font-style: italic;
}
```

```css
p {
    font-size: 40px;
}

p {
    font-size: 100%;
}

p {
    font-size: 2.5em;
}
```

```css

p.thick {
    font-weight: bold;
}
```

## Footer

Align to the bottom. [source](https://stackoverflow.com/questions/643879/css-to-make-html-page-footer-stay-at-bottom-of-the-page-with-a-minimum-height-b)

```css
footer {
    margin-top: auto;
    min-height: 20px;
    padding: 10px;
}
```

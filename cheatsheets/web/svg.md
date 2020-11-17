# SVG

## Setting color


See this [Fills and Strokes](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Fills_and_Strokes) guide on the Mozilla site for how to set colors of an SVG in different ways.

### Fill attribute

```html
<svg>
    <rect x="10" y="10" width="100" height="100" stroke="blue" fill="purple"
        fill-opacity="0.5" stroke-opacity="0.8"/>
</svg>
```

### Inline style

Set color of an element using inline style.

```html
<svg>
    <rect x="10" height="180" y="10" width="180" style="stroke: black; fill: red;"/>
</svg>
```

### CSS

```html
<svg width="200" height="150" xmlns="http://www.w3.org/2000/svg" version="1.1">
  <rect height="10" width="10" id="MyRect"/>
</svg>

<style>
#MyRect {
  fill: red;
  stroke: black;
}
</style>
```

Note this only works because the SVG is elements are defined directly. See the [Current color](#current-color) section for loading and external image and then setting its color.


You can set color of the entire SVG using inline style.

```html
<svg style="fill:#151513; color:#fff">
<!-- ... -->
</svg>
```

### Current color

When loading an external SVG, you need to set `fill="currentColor"` for your CSS to work.

This allows the SVG inherits the color from outside the element. Note use of `svg` and `use` tags, not `img`.

Here is an SVG:

```html
<svg role="img" id="logo-ansible" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
    <title>Ansible icon</title>
    <path fill="currentColor" 
        d="M10.617 11.473l4.686 3.695-3.102-7.662zM12 0C5.371 0 0 5.371 0 12s5.371 12 12 12 12-5.371 12-12S18.629 0 12 0zm5.797 17.305c-.011.471-.403.842-.875.83-.236 0-.416-.09-.664-.293l-6.19-5-2.079 5.203H6.191L11.438 5.44c.124-.314.427-.52.764-.506.326-.014.63.189.742.506l4.774 11.494c.045.111.08.234.08.348-.001.009-.001.009-.001.023z"
    />
</svg>
```

Here is now it is used:

```html
<svg class="logo-small">
    <use xlink:href="https://michaelcurrin.github.io/logos/assets/img/ansible.svg#logo-ansible"></use>
</svg>
```

Now I can use a CSS rule to target the `svg` element. I could use a class or ID or outer `div`, but here I just target all `svg` tags:

```css
svg {
  color: blue;
}
```

On my page here, my SVG is placed inside an anchor tag and so it matches the anchor tag's colors. Which is blue initially and then black when you hover over it. 

[michaelcurrin.github.io/code-cookbook/recipes/](https://michaelcurrin.github.io/code-cookbook/recipes/)

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
<svg width="200" height="150" xmlns="https://www.w3.org/2000/svg" version="1.1">
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

#### Current color on element

This allows the SVG inherits the color from outside the element.

When loading an **external** SVG (loaded as a `.svg` file), you need to set `fill="currentColor"` for your CSS to work.

Here defining an SVG.

```html
<svg role="img" id="logo-ansible" viewBox="0 0 24 24" xmlns="https://www.w3.org/2000/svg">
    <title>Ansible icon</title>
    <path fill="currentColor"
        d="M10.617 11.473l4.686 3.695-3.102-7.662zM12 0C5.371 0 0 5.371 0 12s5.371 12 12 12 12-5.371 12-12S18.629 0 12 0zm5.797 17.305c-.011.471-.403.842-.875.83-.236 0-.416-.09-.664-.293l-6.19-5-2.079 5.203H6.191L11.438 5.44c.124-.314.427-.52.764-.506.326-.014.63.189.742.506l4.774 11.494c.045.111.08.234.08.348-.001.009-.001.009-.001.023z"
    />
</svg>
```

And now loading by URL. 

Note loading by ID as defined above as `id` - you could put multiple SVG images in one SVG file like this. 

Note use of `svg` and `use` tags, not `img`.

```html
<svg class="logo-small">
    <use xlink:href="assets/img/ansible.svg#logo-ansible"></use>
</svg>
```

Now I can use a CSS rule to target the `svg` element. I could use a class or ID or outer `div`, but here I just target all `svg` tags:

```css
svg {
  color: blue;
}
```

On this site, my SVG is placed inside an anchor tag and so it matches the anchor tag's colors. Which is blue initially and then black when you hover over it.


### Current color in CSS

I am new to the `currentColor` approach but looks like there is another way to achieve color changing without Current color set directly on the SVG, as above.

Based on the Minima theme `assets/minima-social-icons.svg` file.

```xml
<svg xmlns="https://www.w3.org/2000/svg" xmlns:xlink="https://www.w3.org/1999/xlink">
    <symbol id="github" fill-rule="evenodd" clip-rule="evenodd" stroke-linejoin="round" stroke-miterlimit="1.414">
        <path d="M8 0C3.58 0 0 3.582 0 8c0 3.535 2.292 6.533 5.47 7.59.4.075.547-.172.547-.385 0-.19-.007-.693-.01-1.36-2.226.483-2.695-1.073-2.695-1.073-.364-.924-.89-1.17-.89-1.17-.725-.496.056-.486.056-.486.803.056 1.225.824 1.225.824.714 1.223 1.873.87 2.33.665.072-.517.278-.87.507-1.07-1.777-.2-3.644-.888-3.644-3.953 0-.873.31-1.587.823-2.147-.09-.202-.36-1.015.07-2.117 0 0 .67-.215 2.2.82.64-.178 1.32-.266 2-.27.68.004 1.36.092 2 .27 1.52-1.035 2.19-.82 2.19-.82.43 1.102.16 1.915.08 2.117.51.56.82 1.274.82 2.147 0 3.073-1.87 3.75-3.65 3.947.28.24.54.73.54 1.48 0 1.07-.01 1.93-.01 2.19 0 .21.14.46.55.38C13.71 14.53 16 11.53 16 8c0-4.418-3.582-8-8-8"/>
    </symbol>
</svg>
```

The icon is used like this in the footer on my [Jekyll Blog Demo](https://michaelcurrin.github.io/jekyll-blog-demo/).

```html
<a href="https://github.com/MichaelCurrin">
    <svg class="svg-icon">
        <use xlink:href="/jekyll-blog-demo/assets/minima-social-icons.svg#github">
        </use>
    </svg>
    <span class="username">MichaelCurrin</span>
</a>
```

It is also used like this in the [social.html](https://github.com/jekyll/minima/blob/master/_includes/social.html), with two classes to color it.

{% raw %}
```html
<a rel="me"
    href="https://github.com/{{ social.github | cgi_escape | escape }}"
    title="{{ social.github | escape }}">
    <svg class="svg-icon grey">
        <use xlink:href="{{ '/assets/minima-social-icons.svg#github' | relative_url }}">
        </use>
    </svg>
</a>
```
{% endraw %}

And here are relevant CSS styles from [Minima](https://github.com/jekyll/minima/blob/master/_sass/minima/_base.scss). Note that `fill: currentColor` is set.

```css
/**
 * Icons
 */

.orange {
  color: #f66a0a;
}

.grey {
  color: #828282;
}

.svg-icon {
  width: 16px;
  height: 16px;
  display: inline-block;

  fill: currentColor;

  padding: 5px 3px 2px 5px;
  vertical-align: text-bottom;
}
```

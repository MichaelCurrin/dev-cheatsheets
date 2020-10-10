---
title: Images
---

Images in markdown as similar to a hyperlink, except it starts with an **exclamation mark**.

The following apply, as with standard links:

- The target can point to a **local** file in the repo or a **remote** URL, as with standard links.
- The text in the first part is alternative text shown while the image is loading (or if fails to load).
- Optional text can be included at the end, to show on hover over.


## General format

```md
![ALT_TEXT](IMG_SRC)

![ALT_TEXT](IMG_SRC "HOVER TEXT")
```

Example code:

```md
![My foo](foo.jpg)

![My foo](foo.jpg "A message about foo")
```

### Notes

- For local paths, the target is **case sensitive**. GitHub will show an error otherwise. Some IDE extensions are case-insensitive and so hide errors that will appear on GitHub.
- You can include multiple images on one line.
    ```md
    ![foo](foo.png) ![bar](bar.png)
    ```
- By default, an image tag alone will lead to a large version of the image (maybe not on static sites). But you can add a link around an image so clicking it goes somewhere.
    ```md
    [![ALT_TEXT](IMG_SRC)](CLICK TARGET)
    ```


## Example of inline vs reference style


### Inline-style

Example:

**Code**:

```md
![Alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "This text shows on hover")
```

**Result:**

Code:

```md
![Alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "This text shows on hover")
```


### Reference-style

**Code**:

```markdown
![Alt text][logo]

Some more text.

[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "This text shows on hover"

There is a logo above but this element but it is not visible in the rendered HTML.
```

**Result**:

![Alt text][logo]

Some more text.

[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "This text shows on hover"

There is a logo above but this element but it is not visible in the rendered HTML.


## Plain HTML

For more control, you can use HTML for your images.

```html
<img src="foo.jpg">
```

Here we make the image clickable, to emulate what a markdown image does.

```html
<a href="https://example.com/foo/">
    <img src="https://example.com/bar.png">
</a>
```


## Styled HTML

Resize and center an image using HTML attributes.

GitHub also sets max-width to `100%` on the CSS when rendering the page, so that means your image can take up a lot of space.

A good way to do this is set the exact height - letting the pixel width change based on desktop or mobile. Fine-tune the value per image.

```html
<p align="center">
    <img height="300px" src="foo.png">
</p>
```

Or use a relative width value:

- `width="80%"`

<!-- Does that work ^ ? -->

Notes:

- Centering and resizing as above **cannot** be achieved by setting CSS (inline or in a style tag) on GitHub, so you must update attributes of the tags. The `align` attribute works for now in HTML5 but will eventually stop as it is deprecated.
- The resizing above works for _HTML_ tags in markdown, but resizing cannot be done for _markdown_ image. At least in Github-flavored implementation of markdown - some other systems support resizing e.g. `![Alt](img.jpg =60x50)`.
- The image will be hyperlinked to the full size version of the image, unless you add an anchor tag.


### Add elements

You can other elements in the outer tag.

In the of a badge as a second element, that will only be centered if the outer element is a `div` and not a `p`.

Example:


```html
<div align="center">
    <a href="https://michaelcurrin.github.io/unicron/">
        <img width="250" src="docs/_media/logo.png" alt="Unicron logo" />

![GitHub Pages site](https://img.shields.io/badge/docs-GitHub_Pages-f967f9?style=for-the-badge)
    </a>

</div>
```

Note the lack of a space before the closing `a` tag otherwise that is just indented text. Or it has to have no indentation.

The badge could also be converted to an `img` tag for consistency. Then a line break is needed to keep the images on separate lines.

```html
<div align="center">
    <a href="https://michaelcurrin.github.io/unicron/">
        <img width="250" src="docs/_media/logo.png" alt="Unicron logo">
        <br>
        <img src="https://img.shields.io/badge/docs-Github_Pages-f967f9?style=for-the-badge" alt="Github Pages site"/>
    </a>
</div>
```


## SVGs

Format:

```md
![Alt text](foo.svg)

![Alt text](https://example.com/foo.svg)
```

Example

**Code:**:

```md
![Alt text](https://placeholder.pics/svg/200x60/DEDEDE/555555/Sample%20SVG)
```

**Result**

![Alt text](https://placeholder.pics/svg/200x60/DEDEDE/555555/Sample%20SVG)


### GitHub links

#### Using raw.githubusercontent.com

If you reference an image on GitHub through the _Raw_ button, you get a link on `raw.githubusercontent.com`. You must add this to the URL to avoid getting an error: `?sanitize=true`.

Example of the above. This could be markdown too, but is HTML to set the width.

```html
<img width="100px"
     src="https://raw.githubusercontent.com/graphql/graphql-spec/master/resources/GraphQL%20Logo.svg?sanitize=true" />
```

<img width="100px"
     src="https://raw.githubusercontent.com/graphql/graphql-spec/master/resources/GraphQL%20Logo.svg?sanitize=true" />

Image link from Wikipedia icon [here](https://en.wikipedia.org/wiki/GraphQL).

If you use a different domains below, though you do **not** need the `sanitize` parameter.

### Using github.io

An asset hosted on a GitHub Pages site.

```md
![Alt text](https://potherca-blog.github.io/StackOverflow/question.13808020.include-an-svg-hosted-on-github-in-markdown/controllers_brief.svg)
```

![Alt text](https://potherca-blog.github.io/StackOverflow/question.13808020.include-an-svg-hosted-on-github-in-markdown/controllers_brief.svg)

### Using rawgithub.com

Raw content on GitHub. This could use reference a branch, tag, or commit hash reference.

```md
![Alt text](https://rawgithub.com/potherca-blog/StackOverflow/master/question.13808020.include-an-svg-hosted-on-github-in-markdown/controllers_brief.svg)
```

![Alt text](https://rawgithub.com/potherca-blog/StackOverflow/master/question.13808020.include-an-svg-hosted-on-github-in-markdown/controllers_brief.svg)

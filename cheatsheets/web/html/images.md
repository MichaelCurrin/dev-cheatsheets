# Images


## Format of the image tag

### HTML

See the [HTML Image tag](https://www.w3schools.com/tags/tag_img.asp) on the W3 Schools site. If you go to the Attributes section, there is a table of details and some have links to other pages on the site.

Attributes of `img` tag:

- `src`
    - Local or external image path. Can be JPG, PNG, SVG, etc.
- `alt`
    - Optional text to describe the image. Use to show as a fallback if the image fails to load. Also used for screen readers.
- `title`
    - Optional text used to show on hover over. If not set, nothing will be shown. This is useful to set as the action that an image will produce, such as clicking a screen to go "Go to homepage" if you link it to your homepage.
    - Similarly, setting `title` on an `a` tag adds hover text.
- `width` and `height`
    - Optional attributes to set dimensions. These can be for example `40`, `40px` - not a percentage. Note these attributes. are similar but separate fro the CSS `width` and `height` attributes which are not specific to an `img` tag.

Note that this is a self-closing tag.

- Simple:
    ```html
    <img src="URL" alt="ALT TEXT" />

    OR

    <img src="URL" alt="ALT TEXT" >
    ```
- Detailed
    ```html
    <img src="URL"
         alt="ALT TEXT"
         title="TITLE TEXT"
         width="WIDTH" height=HEIGHT" />
    ```

Example:

```html
<img src="https://raw.githubusercontent.com/github/explore/6c6508f34230f0ac0d49e847a326429eefbfc030/topics/linux/linux.png"
    alt="shell icon"
    title="Linux"
    width="40" height="40" />
```

<img src="https://raw.githubusercontent.com/github/explore/6c6508f34230f0ac0d49e847a326429eefbfc030/topics/linux/linux.png"
     alt="shell icon"
     title="Linux"
     width="40" height="40" />

### Markdown

Here is an equivalent image in Markdown - excluding dimensions.

```
![](URL)

![ALT TEXT](URL)

![ALT TEXT](URL "TITLE TEXT")
```

Note the quotes for the title.


## Hover over effects

- [How TO - Image Hover Overlay](https://www.w3schools.com/howto/howto_css_image_overlay.asp) on W3 Schools


## Image source set

Provide a set of images of different sizes so the browser can load the appropriate one given with screen size.

e.g.

```html
<img src="foo-800.jpg"
  srcset="
    foo-400.jpg   400w,
    foo-600.jpg   600w,
    foo-800.jpg   800w,
    foo-1000.jpg 1000w
    ">
```

You can find a Jekyll plugins like [jekyll_picture_tag][] to do this for you.

[jekyll_picture_tag]: {% link cheatsheets/jekyll/plugins/recommended.md %}


## Optimize image loading

Code snippets and references to read more.

Note that a LightHouse report on [web.dev/measure/](https://web.dev/measure/) might give you a medium warning on image loading and suggest lazy image loading. So that the images only are fetched when they can actually be seen by the user.

Resources:

- [The “Blur Up” Technique for Loading Background Images](https://css-tricks.com/the-blur-up-technique-for-loading-background-images/) on CSS tricks
- [The Complete Guide to Lazy Loading Images](https://css-tricks.com/the-complete-guide-to-lazy-loading-images/) - using JS to lazy load main and background images
- [A Native Lazy Load for the Web Platform](https://css-tricks.com/a-native-lazy-load-for-the-web-platform/)
- [Tips for rolling your own lazy loading](https://css-tricks.com/tips-for-rolling-your-own-lazy-loading/) (2019 article)
- [img loading attribute](https://www.w3schools.com/tags/att_img_loading.asp) on W3 Schools.

Native lazy loading is new and already available in Chrome 76 from 2019 and is supported in Chromium-based and Firefox browsers from 2020. [source](https://web.dev/native-lazy-loading/)

Add `loading="lazy"` to your `img`.

e.g.

```html
<img src="image.png" loading="lazy" alt="…" width="200" height="200">

<iframe src="https://example.com" loading="lazy"></iframe>
```

Here are the supported values for the `loading` attribute:

- `auto`: Default lazy-loading behavior of the browser, which is the same as not including the attribute.
- `lazy`: Defer loading of the resource until it reaches a calculated distance from the viewport.
- `eager`: Load the resource immediately, regardless of where it's located on the page.

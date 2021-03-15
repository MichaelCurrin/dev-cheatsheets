# Alignment


Using markdown on GitHub, you can't styling with CSS. It gets ignored. If you are using Jekyll or similar to process you markdown as HTML, then this page isn't as relevant, as you an use CSS there.

But, you can use the `align` attribute, on a `div` tag, `p` tag or `img` tag. With value as `"center"` or `"right"`.


## Examples

### Align center

#### Code

```markdown
<div align="center">
  
My _markdown_ text.

More text.

Some SVG images:

[![MichaelCurrin - dev-cheatsheets](https://img.shields.io/static/v1?label=MichaelCurrin&message=dev-cheatsheets&color=blue&logo=github)](https://github.com/MichaelCurrin/dev-cheatsheets)
[![stars - dev-cheatsheets](https://img.shields.io/github/stars/MichaelCurrin/dev-cheatsheets?style=social)](https://github.com/MichaelCurrin/dev-cheatsheets)

</div>
```

#### Result

<div align="center">
  
My _markdown_ text.

More text.

Some SVG images:

[![MichaelCurrin - dev-cheatsheets](https://img.shields.io/static/v1?label=MichaelCurrin&message=dev-cheatsheets&color=blue&logo=github)](https://github.com/MichaelCurrin/dev-cheatsheets)
[![stars - dev-cheatsheets](https://img.shields.io/github/stars/MichaelCurrin/dev-cheatsheets?style=social)](https://github.com/MichaelCurrin/dev-cheatsheets)

</div>


### Align right

Note the text comes _after_ the image in the code, but the results shows the text as _before_ on the left.

Note that this only works because of the `width` attribute on the `img` tag. Something like the `div` tag won't have that. And using `style` to set width will work on a static site but not in plain GitHub markdown.

#### Code

```markdown
<img width="50%" align="right" src="https://github-readme-streak-stats.herokuapp.com/?user=michaelcurrin" />

Paragraph of text.

Next line.

Last line.
```

#### Result

<img width="50%" align="right" src="https://github-readme-streak-stats.herokuapp.com/?user=michaelcurrin" />

<p>
Paragraph of text.
</p>
<p>
Next line.
</p>
<p>
Last line.
</p>

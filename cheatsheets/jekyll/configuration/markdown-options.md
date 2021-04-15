# Markdown options

{% raw %}

See [Markdown Options](https://jekyllrb.com/docs/configuration/markdown/) in the Jekyll docs.

The typical Jekyll set up uses Kramdown, which is covered there.

Here are the default settings:

```yaml
kramdown:
  auto_ids          : true
  entity_output     : as_char
  toc_levels        : [1, 2, 3, 4, 5, 6]
  smart_quotes      : lsquo,rsquo,ldquo,rdquo
  input             : GFM
  hard_wrap         : false
  footnote_nr       : 1
  show_warnings     : false
```

## Auto ID generation

This will generate an ID for you on any markdown headings.

```yaml
auto_ids: true
```


For example, this input:

```markdown
## Foo
```

Becomes this:

```html
<h2 id="foo">
    Foo
</h2>
```

Note - this will not be applied to any HTML headings. You'll have to write that logic yourself as such in your layout.

```liquid
<h2 id="{{ page.title | slugify }}">
    {{ page.title }}
</h2>
```

Regardless of whether you use the markdown or HTML approach as above, the headings won't be clickable.

So you could do this in a includes or layout file.

```liquid
{% assign slug = page.title | slugify %}
<h2 id="{{ slug }}">
    <a href="#{{ slug }}">
        {{ page.title }}
    </a>
</h2>
```

Note the use of `h2` on the outside and `a` on the inside. Regardless of indentation, Jekyll converts some angle brackets to be weirdly escaped if you use `a` on the outside - unless the whole thing is in a `div`.

Even on oneline formats badly in HTML or markdown files.

```liquid
<a href="#{{ slug }}"><h2 id="{{ slug }}">{{ page.title }}</h2></a>
```

Becomes:

```html
<p><a href="#about">&lt;h2 id="about"&gt;About&lt;/h2&gt;</a></p>
```

If you don't like a heading being styled like a blue link, you reset it to a standard heading like black.

```html
<style>
    h2>a {
        color: initial;
    }

</style>
```


{% endraw %}

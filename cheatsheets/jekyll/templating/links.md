# Links

{% raw %}

## Local paths

There are multiple ways to do this, depending on your situation.

### Relative URL

Use the `relative_url` filter to ensure you get a GitHub Pages project prefix added.

The downside to this approach that it uses a literal string - is does not validate if the page actually exists and also does not obey and permalink settings set on the metadata or config.

```markdown
- [Link text]({{ '/' | relative_url }})
- [Link text]({{ 'asserts/foo.js' | relative_url }})
```

If you reference a page object, then it is safer to expect the URL to be valid - use of config settings might affect this though such as permalink or collections.

Use `page` object for the current page.

```markdown
- [Link text]({{ page.url | relative_url }})
```

Use a `for` loop on pages or a collection.

```markdown
{% for item in site.pages %}
- [Link text]({{ item.url | relative_url }})
{% endfor %}
```


## Liquid tags

Use a Jekyll Liquid tag `link` to link to page rather than by URL. This is great for reliability, as means you will get an error if a link is invalid, like if you made a typo or the target page is renamed, moved or deleted.

### Link tag for pages

Use the `link` tag. The smart way to do links for local pages.

No colon and no quotes. A quoted path will rendered literally with escaped quote tags and breaks the HTML.

```liquid
{% link PATH %}
```

Examples below are adapted from the [docs](https://jekyllrb.com/docs/liquid/tags/).

```liquid
{% link _products/coffee-machine.md %}
{% link _posts/2021-07-26-name-of-post.md %}
{% link about.md %}
{% link news/index.html %}
{% link assets/css/styles.css %}
```

Add a leading `/` if you want. It makes no difference.

Since Jekyll 4.0, you don’t need to prepend the `link` or `post_url` tags with `site.baseurl`.

- Jekyll 3
    ```md
    [Link text]({% link about.md %})
    ```
- Jekyll 4
    ```md
    [Link text]({% link about.md %})
    ```

Result:

```html
<a href="/my-base-url/about.html">Link text</a>
```

I think you can pass a variable too, such as when using a `for` loop. Maybe only in Jekyll 4?

```markdown
[Link text]({% link {{ item.url }} %})
```

### The Post URL tag for posts

Link to a post by name using `post_url`.

```liquid
{% post_url 2010-07-21-name-of-post %}
{% post_url /subdir/2010-07-21-name-of-post %}
```

Markdown:

```liquid
[Link Text]({% post_url 2010-09-08-welcome-to-jekyll %})
```


## Reference-style links

### Plain Markdown

In Markdown and therefore also Jekyll sites, you can use reference-style links. This means your Markdown code is shorter and more readable in a paragraph, while not changing the rendered HTML.

For example, set up like this, as per the [Markdown Links][] page.
```md
Here is my [Homepage][].

And here is my [Homepage][] again.

[Homepage]: https://michaelcurrin.github.io/
```

### Liquid

This reference style is especially good if your have an internal link that is managed with Jekyll and the `link` tag.

```liquid
Go to my [About][] page.

Order a [Fidget Spinner][] from the Products section.

[About]: {% link about.md %}
[Fidget Spinner]: {% links _projects/fidget-spinner.md %}
```

Which is easier to read and manage than putting the links and Liquid code in a parapraph.


## Open in a new window

This uses a feature of _Kramdown_, which is used by Jekyll by default. So you don't need to add a plugin or anything.

```md
[Foo](https://jekyllrb.com){:target="_blank"}
```

This as adds `target="_blank"` to the `a` tag.


## Build revision

Add build revision number to a URL. This allows an asset to be kept in the browser cache and then a new one requested when the build revision changes i.e. when the the HTML is deployed with a new version number in it.

This is part of a cache busting technique.

There is still just one  CSS file available though.

```liquid
<link rel="stylesheet" href="{{ '/assets/css/style.css?v=' | append: site.github.build_revision | relative_url }}">
```

```css
<link rel="stylesheet" href="/coding-blog/assets/css/style.css?v=1283d21174f64150a302c80eca82d47bb5bdeb06">
```

Based on the Midnight theme.


{% endraw %}

[Markdown Links]: {% link cheatsheets/markdown/links.md %}

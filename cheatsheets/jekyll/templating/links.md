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

Use a Jekyll Liquid tag link to link to page rather than by URL. This is great for reliability, as means you will get an error if a link is invalid.

### Link tag for pages

Use the `link` tag. The smart way to do links for local pages.

No colon and no quotes. (A quotes path will rendered as escaped quote tags and possibly break the HTML)

```liquid
{% link PATH %}
```

Examples below are from [docs](https://jekyllrb.com/docs/liquid/tags/).

```liquid
{% link _collection/name-of-document.md %}
{% link _posts/2016-07-26-name-of-post.md %}
{% link news/index.html %}
{% link /assets/files/doc.pdf %}
```

Since Jekyll 4.0, you don’t need to prepend `link` and `post_url` tags with `site.baseurl`.

- Jekyll 3
    ```md
    Link text]({{ site.baseurl}} {% link about.md %})
    ```
- Jekyll 4
    ```md
    [Link text]({% link about.md %})
    ```

Result:

```html
<a href="/my-base-url/about.html">Link text</a>
```

You can pass a variable too (maybe only in Jekyll 4 as I got errors on this when testing).

```markdown
[Link text]({% link {{ item }} %})
```

### The Post URL tag for posts

```liquid
{% post_url 2010-07-21-name-of-post %}
{% post_url /subdir/2010-07-21-name-of-post %}
```

Markdown:

```liquid
[Link Text]({% post_url 2010-09-08-welcome-to-jekyll %})
```


## Footer links

More Markdown then Jekyll, but still useful to keep text readable. Also this link be just below the paragraph rather than the end of the page.

```md
This paragraph covers [CircleCI][0], [GitHub][1] and also [Bitbucket][2].

[0]: https://circleci.com/
[1]: https://github.com/
[2]: https://bitbucket.org/
```

This paragraph covers [CircleCI][0], [GitHub][1] and also [Bitbucket][2].

[0]: https://circleci.com/
[1]: https://github.com/
[2]: https://bitbucket.org/

{% endraw %}

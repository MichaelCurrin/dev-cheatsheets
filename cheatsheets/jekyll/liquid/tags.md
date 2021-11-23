# Tags

{% raw %}


## Link tag

Link to a page by path.

This will raise an error if the file is missing. In Jekyll 4, this is also relative URL so you don't need to prepend base URL.

Note no quotes or colon.

```liquid
{% link foo.md %}

{% link foo/bar.md %}
```

```liquid
<img src="{% link assets/img/foo bar.jpg %}" />
```

Use a variable instead.

<!--

```liquid
<img src="{% link {{ img_src }} %}" />
```

Maybe not for link tag or Jekyll 3? Or maybe just because `link` is a special less flexible one.

-->


It works at least for `include` tag. Based on Jekyll's own [tests](https://github.com/jekyll/jekyll/blob/master/test/source/_posts/2013-12-17-include-variable-filters.markdown).

```liquid
{% include {{ page.abc }} %}

{% include {{ page.abc | append: '.html' }} %} 

{% include {{ page.abc }}.html a='b' def=1 %} 
```

{% endraw %}

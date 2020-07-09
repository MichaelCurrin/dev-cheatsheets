---
title: Jekyll tags
---

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

Use a variable instead:

```liquid
<img src="{% link {{ img_src }} %}" />
```

{% endraw %}

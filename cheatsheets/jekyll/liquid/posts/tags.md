# Tags

{% raw %}

## Define

```yaml
---
title: My title
tags: abc
---
```

Or

```yaml
tags: abc def-ghi xyz
---
```

The result will be:

```json
["abc", "def-ghi", "xyz"]
```


## List tags on a post page

```liquid
<div>
    <span>
        <b>Tags:</b>
    </span>

    {% for tag in page.tags %}
        <span>
            <b>#{{ tag }}</b>
        </span>
    {% endfor %}
</div>
```


## List all tags and posts

Example based on Jekyll docs.

```liquid
{% for tag in site.tags %}
    <h3>
        #{{ tag[0] }}
    </h3>
    <ul>
        {% for post in tag[1] %}
            <li>
                <a href="{{ post.url | relative_url }}">
                    {{ post.title }}
                </a>
            </li>
        {% endfor %}
    </ul>
{% endfor %}
```

{% endraw %}

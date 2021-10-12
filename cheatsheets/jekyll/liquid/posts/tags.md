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


## List tags and posts

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

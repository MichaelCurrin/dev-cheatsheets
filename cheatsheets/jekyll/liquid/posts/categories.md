# Categories

{% raw %}


 

## Get categories

```liquid
{% for c in site.categories %}
- {{ c[0] }}
{% endfor %}
```


## Get categories and their posts

Unpack a hash where `c[0]` is the key (the category name) and `c[1]` is the value (the array of posts).

```liquid
<ul>
    {% for c in site.categories %}
        <li>
            {{ c[0] }}
            <ul>
                {% for p in c[1] %}
                    <li>
                        <a href="{{ p.url | relative_url }}">
                            {{ p.title}}
                        </a>
                    </li>
                {% endfor %}
            </ul>
        </li>
        {% endfor %}
</ul>
```


## Get posts in target category

```liquid
{% for p in site.categories.foo limit: 3 %}
- {{ p.title }}
{% endfor %}
```

{% endraw %}

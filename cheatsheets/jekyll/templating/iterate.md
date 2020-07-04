---
title: Iterate over data
---

You can iterate over data in a data file or in the current page's frontmatter or any global variables from Jekyll or a plugin.

[source](https://stackoverflow.com/questions/17677094/jekyll-for-loop-over-all-images-in-a-folder)

## List of key-value pairs

`_data/items.yaml`
```
- foo: A
  bar: 10
  baz: 1000
- foo: B
  bar: 20
  baz: 999
```

`index.md`
```
---
---
{% for item in site.data.items %}
- {{ item.foo }} - {{ item.bar }} - {{ item.baz }}
{% endfor %}
```

## Key-value pairs


`_data/items.yaml`
```
Foo: A
Bar: B
```


`index.md`
```
{% for hash in site.data.items %}
- Key: {{ hash[0] }} - Value: {{ hash[1] }}
{% endfor %}
```

If the value is also a hash then you can do an inner loop which looks similar.


Another example

`index.md`
```
{% for link_hash in page.links %}
  {% for link in link_hash %}
    <a href="{{ link[1] }}">{{ link[0] }}</a>
  {% endfor %}
{% endfor %}
```

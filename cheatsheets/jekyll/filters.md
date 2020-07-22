---
title: Jekyll filters
---

{% raw %}

## Resources

### Reference docs

- [Filters](https://jekyllrb.com/docs/liquid/filters/) in Jekyll docs. See standard filters near the bottom.
- [Filters](https://shopify.github.io/liquid/filters/abs/) in Shopify docs. Jekyll links to these.


### Cheatsheets

- [Jekyll Cheatsheet](https://learn.cloudcannon.com/jekyll-cheat-sheet/) on CloudCannon
- [Jekyll](https://devhints.io/jekyll) on DevHints
- [gist](https://gist.github.com/JJediny/a466eed62cee30ad45e2)


## Filters

From [tutorial](https://blog.webjeda.com/jekyll-filters/)

### where

```
where: KEY, VALUE
```

e.g.

Warning - this will not raise an error if the page is not found.

```liquid
{% assign item = site.pages | where: 'name', 'foo' | first %}
```

```liquid
{% assign posts = site.posts | where: "categories", "Foo" %}
{% for post in posts limit: 5 %}
    <li>{{ post.title}} </li>
{% endfor %}
```

### group_by

```liquid
{% assign items_grouped = site.posts | group_by: 'author' %}

{{ items_grouped }}
```

```ruby
{"name"=>"sharath", "items"=>[#, #], "size"=>2}
{"name"=>"webjeda", "items"=>[#, #, #, #, #, #, #, #, #, #, #, #], "size"=>12}
{"name"=>"someone", "items"=>[#], "size"=>1}
```


{% endraw %}

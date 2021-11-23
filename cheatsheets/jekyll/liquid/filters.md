# Filters

{% raw %}


## Resources

### Reference docs

- [Filters](https://jekyllrb.com/docs/liquid/filters/) in Jekyll docs. See standard filters near the bottom.
- [Filters](https://shopify.github.io/liquid/filters/abs/) in Shopify docs. Jekyll links to these.
- [filters.rb](https://github.com/jekyll/jekyll/blob/master/lib/jekyll/filters.rb) code in Jekyll repo.


### Cheatsheets

- [Jekyll Cheatsheet](https://learn.cloudcannon.com/jekyll-cheat-sheet/) on CloudCannon
- [Jekyll](https://devhints.io/jekyll) on DevHints
- [gist](https://gist.github.com/JJediny/a466eed62cee30ad45e2)


## Filters

From [tutorial](https://blog.webjeda.com/jekyll-filters/)

### Convert HTML to Markdown

```
markdownify
```

e.g.

```liquid
{{ '# _Heading_ ' | markdownify }}
```

### Convert object to JSON

Convert array or map or a primitive value to JSON value.

```
jsonify
```

e.g. `foo` with value `{"a" => 1, "b" => 2 }`

```liquid
{{ foo | jsonify }}
```

```json
{"a":1,"b":2}
```

### inspect

Show the value of a variable or expression as an object. This is useful for debugging, especially if a value is hard to find because it is nil or an empty string, this will make it explicity. It will also make sure an array gets rendered as an array and not just space-separated values.

```
inspect
```

```liquid
{{ 'foo' | inspect }}
```

Try it on some frontmatter values or a data file.


```liquid
{{ page | inspect }}

{{ site.data.foo | inspect }}
```

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
{% assign posts = site.posts | where: "categories", "foo" %}

{% for post in posts limit: 5 %}
- {{ post.title }} 
{% endfor %}
```

In the above case, using `site.categories.foo` would be more convenient.

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

### plus

```liquid
{% assign crumb_limit = forloop.index | plus: 1 %}
```


## Array and loop handling

### Sorting

```liquid
{% assign foo = foo | reverse %}
```

If the variable is an array of strings:

```liquid
{% assign foo = foo | sort %}
```

If the variable is an array of hashes, you need to specify a key to sort on.

```liquid
{% assign foo = foo | sort: 'path' %}
```

### Size attribute

```liquid
{% if crumbs.size > 2 %}
{% endif %}
```

### limit

```liquid
{% for crumb in crumbs limit: crumb_limit %}
{% endfor %}
```

### offset

Do a slice ignoring the last item.

```liquid
{% for crumb in crumbs offset: 1 %}
{% endfor %}
```

Similar to `pop` except `offet` preserves the original value.

```liquid
{% assign foo = bar | pop %}
```

Longer form for interest:

```liquid
{% assign foo = bar | slice: 0, -1 %}
```

You can't pop from the front, but you can do a slice starting at 2nd element.

```liquid
{% assign foo = slice: 1, foo.fize %}
```

### unless, last, index

```liquid
{% for crumb in crumbs offset: 1 %}
    {% unless forloop.first %}
        ...
    {% endunless %}
    {% if forloop.last %}
        ...
    {% else %}
        {% assign crumb_limit = forloop.index | plus: 1 %}
        ...
    {% endif %}
{% endfor %}
```

{% endraw %}

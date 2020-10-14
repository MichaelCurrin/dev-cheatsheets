---
title: Filters
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

## plus

```liquid
{% assign crumb_limit = forloop.index | plus: 1 %}
```

## Array and for loop handling

### size

```
{% if crumbs.size > 2 %}
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

{% assign foo = slice: 1, foo.fize %}

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


## Full list

Grouped by functionality.


### Array

The might work on an array too.

    append

    prepend

    concat

    join

    first

    last

    slice

    map

    size

    reverse

    sort

    sort_natural

    uniq

    remove

    remove_first

    compact - Removes any nil values from an array.


### Text

    date

    replace

    replace_first

    escape

    escape_once

    default

    strip

    lstrip

    rstrip

    capitalize

    downcase

    upcase

    strip_html

    strip_newlines

    split

    newline_to_br

    truncate

    truncatewords

    url_decode

    url_encode

### Maths and conditions

    times

    abs

    divided_by

    at_least

    at_most

    ceil

    floor

    minus

    modulo

    plus

    round

# Non-empty

{% raw %}

How to handle `if` statements to check that a value is defined and has a non-null value.

The [Truthy Falsy]({{ site.baseurl }}{% link cheatsheets/jekyll/liquid/truthy-falsy.md %}) page for a list of what is truth and falsy. The _Truthy_ section will probably surprise you. As Jekyll doesn't behave like other languages like Python or JavaScript.


## Check variable is defined and not null

In Jekyll, an `if` statement on a variable will be truth if:

- The variable is defined (i.e. declared, not missing).
- The variable is not `null`.

```liquid
{% if my_var %}
    {{ my_var }}
{% endif %}
```

Warning - this check will return `true` even for a value that is a zero number, an empty string, or an empty array.


## Check number is non-zero

```liquid
{% if my_int and my_int != 0 %}
    {{ my_int }}
{% endif %}
```


## Check array has items in it

Here we check an array is defined and that it has at least one element.

```liquid
{% if my_array and my_array.size != 0 %}
    {{ my_array | inspect }}
{% endif %}
```

It is **not** sufficient to check `my_var.size` as a zero value is still truthy.

Example case:

```liquid
{% if page.playgrounds and page.playgrounds.size != 0 %}
    <h3>Online playgrounds</h3>

    <ul>
    {% for item in page.playgrounds %}
    <li>
        {{ item.name }}
    <li>
    {% endfor %}
    </ul>
{% endif -%}
```

If you just had a `for` loop, that wouldn't matter. But if you might want to know an array has values in it so you can render a heading before it.


## Detecting nil values with where filter

From the [docs](https://jekyllrb.com/docs/liquid/filters/).

Only Jekyll 4.

Using `nil` to select posts that either do not have `my_prop` defined or `my_prop` has been set to `nil` explicitly.

```liquid
{% assign filtered_posts = site.posts | where: 'my_prop', nil %}
```

Using Liquid's special literal `empty` or `blank` to select posts that have `my_prop` set to an empty value.

```liquid
{% assign filtered_posts = site.posts | where: 'my_prop', empty %}
```

{% endraw %}

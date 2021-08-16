# For loops

{% raw %}

These are not filters, as they cannot be used alone. Only in a `for` loop.

Given array:

```yaml
my_array:
  - 1
  - 2
  - 3
```


## For loop modifiers

### Limit

Get the first N items.

```liquid
{% for item in page.my_array limit: 2 %}
    {{ item }}
{% endfor %}
```

Skip the first items and started at the Nth item.

```liquid
{% for item in page.my_array offset: 2 %}
   {{ item }}
{% endfor %}
```

### Reversed

```liquid
{% for item in page.my_array reversed %}
    {{ item }}
{% endfor %}
```


### For loop variables

### Index

Index of the current iteration. Use `.index` to start at one or `.index0` to start at zero.

```liquid
{% for item in page.my_array %}
    {{ forloop.index }}  <!-- e.g. 1, 2, 3 -->
    {{ forloop.index0 }} <!-- e.g. 0, 1, 2 -->
    {{ forloop.last }}  <!-- e.g. false, false, true -->
{% endfor %}
```

Using `last` is useful if you are rendering a separator. Like a comma between JSON values or a pipe symbol `|` beween items in a menu.

```liquid
{
{% for key_value in page.my_array %}
    {{ key_value[0] | jsonify }}: {{ key_value[1] | jsonify }}
    {% unless forloop.last %},{% endunless %}
{% endfor %}
}
```

### Length

```liquid
{{ forloop.length }}
```

{% endraw %}

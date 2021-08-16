# Conditionals

The `if`, `else`, and `unless` statements come from Ruby.


{% raw %}

## if statement

```liquid
{% if expression %}
    {{ value }}
{% endif %}
```

Example using [Google Analytics][]

```liquid
 {%- if jekyll.environment == 'production' and site.google_analytics -%}
     {%- include google-analytics.html -%}
 {%- endif -%}
 ```
 

## else statement

```liquid
{% if expression %}
    {{ value }}
{% else %}
    {{ other_value }}
{% endif %}
```

Example, using assignment:

```liquid
{% if expression %}
    {% assign answer = "yes" %}
{% else %}
    {% assign answer = "yes" %}
{% endif %}

{{ answer }}
```


## unless statement

```liquid
{% unless expression %}
    {{ value }}
{% endunless %}
```

This is a negated `if` statement.

So you could have equally done:

```
{% if not expression %}
```

Using `unless` can be useful for adding a separator between items.

```liquid
<p>
    {% for item in page.my_array %}
        {{ item }}
        {% unless forloop.last %}, {% endunless %}
    {% endfor %}
</p>
```

Consider also using the `join` filter which will do something similar for joining strings as one string.

{% endraw %}


[Google Analytics]: {{ site.baseurl }}{% link cheatsheets/jekyll/templating/analytics.md %}

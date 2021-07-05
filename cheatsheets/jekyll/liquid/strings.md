# Strings

{% raw %}


## Contains

Maybe using Regex for startswith? There is no `startswith` or `starts_with` alone or on a string.

```liquid
{% if my_string contains 'foo' %}
  Yes!
{% endif %}
```


## Case

```liquid
{{ my_string | upcase }}
```

```liquid
{{ my_string | downcase }}
```


{% endraw %}

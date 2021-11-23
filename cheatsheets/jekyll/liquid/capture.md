# Capture

{% raw %}

Rather than using `append` and `prepend` Jekyll filters, you code can look more natural using `capture`.


## Basic

```liquid
{%- capture my_var -%}
/api/{{ name }}.json
{%- endcapture -%}
```

You can do multiple lines.

```liquid
{%- capture foo -%}
abc {{ name }} def
xyz 123
{%- endcapture -%}
```



## Trim whitespace

That is fine for most purposes.

Note that if you subsitute in a string, you'll get a multi-line value.

Like

```html
<script>
const value = "
/api/foo.json
"
</script>
```

So trim it.

```liquid
{%- capture my_data -%}
/api/{{ name }}
{%- endcapture -%}
```

Note use of `-` before and after the value, to avoid the newlines. Using `-` on the outer of the entire capture doesn't work.

Or

```liquid
{% capture my_data %}/api/{{ name }}{% endcapture %}
```

{% endraw %}

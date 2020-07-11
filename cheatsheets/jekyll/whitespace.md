---
title: Whitespace
render_with_liquid: false
---

## Variable

Trim whitespace from value.

```liquid
{{- my_text -}}
```

## Raw

`raw` tag without the whitespace. This is useful inside `capture` tag.

```liquid
{%- raw -%}{% highlight ruby %}
def foo
  puts 'foo'
end
{% endhighlight %}{% endraw -%}
```

Note the `endraw` cannot start with `%-`.

This would give too much whitespace:

{% raw %}
{% highlight ruby %}
def foo
  puts 'foo'
end
{% endhighlight %}
{% endraw %}

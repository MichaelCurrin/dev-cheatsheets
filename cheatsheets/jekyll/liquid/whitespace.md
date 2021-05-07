---
render_with_liquid: false # Jekyll 4
---
# Whitespace

{% raw %}

## Variable

Trim whitespace from value.

```liquid
{{- my_text -}}
```


## Raw

`raw` tag without the whitespace. This is useful inside `capture` tag.

The proper raw tag is shown as "raw" here otherwise it would not render on this page.

```liquid
raw {% highlight ruby %}
def foo
  puts 'foo'
end
{% endhighlight %} endraw 
```

Note the `endraw` cannot start with a dash.

This would give **too much** whitespace:

```liquid
raw 
{% highlight ruby %}
def foo
  puts 'foo'
end
{% endhighlight %}
endraw
```

{% endraw %}

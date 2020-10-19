---
description: Backticks vs highlight tag
---
# Basics

## Markdown code blocks

This works in Jekyll and plain markdown too.

Code:

    ```ruby
    def foo
      puts 'foo'
    end
    ```

Result:

```ruby
def foo
  puts 'foo'
end
```


## Highlight tag

This works in Jekyll only.

Code:

{% raw %}
```liquid
{% highlight ruby %}
def foo
  puts 'foo'
end
{% endhighlight %}
```
{% endraw %}

Result:

{% highlight ruby %}
def foo
  puts 'foo'
end
{% endhighlight %}

### With line numbers

Add `linenos` to the tag.

Code:

{% raw %}
```liquid
{% highlight ruby linenos %}
def foo
  puts 'foo'
end
{% endhighlight %}
```
{% endraw %}

Result:

{% highlight ruby linenos %}
def foo
  puts 'foo'
end
{% endhighlight %}

Unfortunately this renders poorly in Minima as it becomes a table - the width must be reduced to not be 100% and there are borders must be removed:

Code:

```html
<style>
.rouge-table {
	width: initial;
}
table {
	border: none;
}
table td {
	border: none;
}
td pre {
	border: none;
}
</style>
```

<!-- Hidden on frontend -->

<style>
.rouge-table {
	width: initial;
}
table {
	border: none;
}
table td {
	border: none;
}
td pre {
	border: none;
}
</style>

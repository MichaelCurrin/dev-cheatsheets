# Jekyll codeblocks cheatsheet

Here we have Liquid code which needs to be shown as code and not rendered (it may cause errors), so use the `raw` tag. This will not show up literally but will ensure any Liquid content inside it is no evaluated.

## Code blocks

```ruby
def foo
  puts 'foo'
end
```


## Highlight tag

```liquid
{% highlight ruby linenos %}
def foo
  puts 'foo'
end
{% endhighlight %}
```

Optionally add line numbers.

```
{% highlight ruby linenos %}
```

## Showing Liquid snippets

Prevent Liquid snippets from rendering and give them syntax highlighting.


### Codeblock


Note that the codeblock goes _inside_ the `raw` tag to avoid unnecessary empty lines showing up.

To use HTML highlighting (Liquid parts are plain). 

	{% raw %}
	```html
	<div>

	{{ site.test }}

	</div>
	```
	{% endraw %}


To use Liquid highlighting (HTML tags are plain)

	{% raw %}
	```liquid
	<div>

	{{ site.test }}

	</div>
	```
	{% endraw %}


### Highlight tag

This renders output the same as in the above section.

Note the `raw` tag goes _inside_ the `highlight `tag, otherwise the `highlight` will not be evaluated.

Use Liquid highlighting.

	{% highlight liquid %}
	{% raw %}
	<div>

	{{ site.test }}

	</div>
	{% endraw %}
	{% endhighlight %}

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE4MTM5MDE0OTcsLTE3MzYzODc1NTYsMT
EyNDYxNDY2NF19
-->
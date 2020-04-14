# Jekyll codeblocks cheatsheet

Here we have Liquid code which needs to be shown as code and not rendered (it may cause errors), so use the `raw` tag.

## Codeblock

Use HTML highlighting (HTML tags are colored but Liquid is plain). 

	{% raw %}
	```html
	<div>

	{{ site.test }}

	</div>
	```
	{% endraw %}


Use Liquid highlighting (HTML tag plain)

	{% raw %}
	```liquid
	<div>

	{{ site.test }}

	</div>
	```
	{% endraw %}

## Highlight

	{% highlight liquid %}
	{% raw %}
	<div>

	{{ site.test }}

	</div>
	{% endraw %}
	{% endhighlight %}

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTkyODk1MjM1Nl19
-->
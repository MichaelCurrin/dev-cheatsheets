# Jekyll codeblocks cheatsheet

Here we have Liquid code which needs to be shown as code and not rendered (it may cause errors), so use the `raw` tag. This will not show up literally but will ensure any Liquid content inside it is no evaluated.

## Codeblock


Note that the codeblock goes _inside_ the `raw` tag to avoid unnecessary empty lines showing up.

Use HTML highlighting (Liquid parts are plain). 

	{% raw %}
	```html
	<div>

	{{ site.test }}

	</div>
	```
	{% endraw %}


Use Liquid highlighting (HTML tags are plain)

	{% raw %}
	```liquid
	<div>

	{{ site.test }}

	</div>
	```
	{% endraw %}

## Highlight tag

This renders output the same as the in the above section.

Note the `raw` tag goes _inside_ the `highlight `tag.

Use Liquid highlighting.

	{% highlight liquid %}
	{% raw %}
	<div>

	{{ site.test }}

	</div>
	{% endraw %}
	{% endhighlight %}

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEwNDM0MjQ2MzAsMTEyNDYxNDY2NF19
-->
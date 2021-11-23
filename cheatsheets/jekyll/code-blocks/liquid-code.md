---
description: How to show Liquid code as highlighted snippets in Jekyll
---
# Display Liquid code snippets


Here we ensure that Jekyll templating Liquid code is not evaluated at build time, but treated as literal text, with syntax highlighting. This is useful for docs and tutorials around Jekyll.

e.g.

{% raw %}
```liquid
{{ foo }}

{% link bar.md %}
```
{% endraw %}

Make sure you understand [Basics][] first.

[Basics]: {% link cheatsheets/jekyll/code-blocks/basics.md %}


## Code block approach

Here we have Liquid code which needs to be shown as code and not rendered through Jekyll templating (as it may cause errors). We use the `raw` tag around an HTML or Liquid code-block.

Note that the code block should go _inside_ the `raw` tag to avoid unnecessary empty lines showing up.

### HTML

Apply HTML highlighting  - Liquid parts will be plain.

Note - you will also need to use the `raw` tag - not shown here since nesting a `raw` tag for a tutorial is not practical.

{% raw %}

**Code:**

	```html
	<div>
	    {{ site.title }}
	</div>
	```

**Result:**

```html
<div>
    {{ site.title }}
</div>
```

{% endraw %}

### Liquid

Apply Liquid highlighting - HTML tags will not get highlighting.

{% raw %}

**Code:**

	```liquid
	<div>
	    {{ site.title }}
	</div>
	```

**Result:**

```liquid
<div>
    {{ site.title }}
</div>
```

{% endraw %}


## Highlight tag approach

Using the Jekyll `highlight` tag.

Apply Liquid highlighting. Note you should use the `raw` tag inside the `div`, not shown here. Note the `raw` tag must go _inside_ the `highlight` tag - if it `raw` is on the outside then the `highlight` will be literal text.

**Code:**

{% raw %}
	{% highlight liquid %}
	<div>
	    {{ site.test }}
	</div>
	{% endhighlight %}
{% endraw %}

**Result:**

{% highlight liquid %}
<div>
    {% raw %}{{ site.test }}{% endraw %}
</div>
{% endhighlight %}


That renders output the _same_ as in the above section which uses a `liquid` code block.

This is just a different approach:

- It only works in Jekyll sites not plain markdown.
- It is more verbose but allows customization such as adding line numbers.
- You can combine approaches to nest a markdown backtick code block inside a `highlight` block, when two layers of backticks or `highlight` would not work (though indenting a backtick code block would work).

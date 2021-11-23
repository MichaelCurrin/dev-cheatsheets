# Includes

{% raw %}

Do you know about includes files in Jekyll?

Rather than determining the layout of a page so its hard to add stuff to it, the includes functionality is like a function or piece of reusable code. Which you can use on pages or layouts.

And it works well with parameters.

From the [docs](https://jekyllrb.com/docs/includes/)

`_include/image.html`

```liquid
<figure>
   <a href="{{ include.url }}">
   <img src="{{ include.file }}" style="max-width: {{ include.max-width }};"
      alt="{{ include.alt }}"/>
   </a>
   <figcaption>{{ include.caption }}</figcaption>
</figure>
```

Call like

```liquid
---
---
{% include image.html url="http://jekyllrb.com"
max-width="200px" file="logo.png" alt="Jekyll logo"
caption="This is the Jekyll logo." %}
```

Or pass variable names instead of values, as defined in frontmatter or data file. Be careful not to override URL on the page with an image url or it can break things.

```liquid
---
my_image:
  url: '...'
  alt: '...'
---
{% include image.html url=page.my_image.url alt=page.my_image.html ... %}

From _data/gallery.yaml

{% include image.html url=site.data.gallery.my_image.url 
... %}
```

Or pass an object with attributes on it.

```liquid
---
my_image:
  url: '...'
  alt: '...'
---
{% include image.html image_attributes=page.my_image %}
```


{% endraw %}

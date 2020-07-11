---
title: Jekyll Templating
layout: listing
---

Cheat sheet for using Jekyll Liquid and plain HTML in Jekyll projects.

{% raw %}

## Comment

```liquid
{% comment %}
    Comment message
{% endcomment %}
```

## Collections

### Iterate over collection

- `_config.yml`
    ```yaml
    collections:
    foo:
        output: true
    ```
- `_foo/bars/*.md`
- `index.md`
    ```liquid
    ---
    ---
    {% for item in site.foo.bars %}
    {{ item.title }}
    {% endfor %}
    ```


## Filter assets

[source](https://stackoverflow.com/questions/17677094/jekyll-for-loop-over-all-images-in-a-folder)

```liquid
{% for asset in site.static_files %}
    {% if asset.path contains '<NEEDLE>' %}
        <a href="{{ asset.path | relative_url }}">{{ asset.path }}</a>
    {% endif %}
{% endfor %}
```


## Improve this page

Add a button for visitors to go to GitHub and edit the page.

Sample text:

- Improve this page
- Edit this page
- Edit on GitHub
- Edit this page on GitHub

For an icon, use one of:

- Unicode emoji, safe to use in HTML: 📝
- FontAwesome icon: `<i class="fa fa-pencil"></i>`

### Jekyll

```html
<a href="https://github.com/MichaelCurrin/dev-cheatsheets/edit/master/{{ page.path }}">
    Improve this page
</a>
```

See also the `_includes` folder of this repo.


### DocsifyJS

For DocsifyJS, use a plugin:

- [njleonzhang/docsify-edit-on-github](https://github.com/njleonzhang/docsify-edit-on-github)

{% endraw %}

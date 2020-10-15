---
title: Tips
---


## Page not found

Prevent  path from being`404/index.html` when using `permalink: pretty` in config.

```
permalink: /404.html
```

Hide from sitemap. This is only necessary when using pretty, as it will be ignored normally.

```
sitemap: false
```


## Custom robots

If you use the Jekyll Sitemap plugin, you will automatically get a robots file on both prod and dev build.

You can create a custom file. The layout must be null otherwise it will use default layout with too much HTML.

```markdown
---
layout: null
---
User-agent: *
Sitemap: {{ site.url }}/sitemap.xml
```

You might also need `sitemap: false`.

## Sitemap

Using Jekyll Sitemap plugin, the `sitemap.xml` file is created on prod and dev builds, but the `url` in the config will only be used on a prod build. Otherwise it will just be localhost in the sitemap.


## Layouts

Set default layout for all pages. Is this needed - isn't default the default? See artists-portfolio repo.

```yaml
defaults:
  - scope:
      path: ""
    values:
      layout: "default"
      text_width: true
  - scope:
      path: "index.html"
    values:
      text_width: false
 ```

Here, the `index.md` pages at all levels get certain layout. And everything else defaults to `page` layout. Anything else is set on a page itself.

```yaml
defaults:
  - scope:
      path: "**/index.md"
    values:
      layout: "listing"
  - scope:
      path: ""
    values:
      layout: "page"
```

## Markdown in HTML

In a `.html` layout file, you can use `markdownify` to turn markdown into HTML.

```markdown
<footer>

    {{ 'GitHub repo: [MichaelCurrin/cheatsheets ![Repo stars](https://img.shields.io/github/stars/MichaelCurrin/cheatsheets?style=social)](https://github.com/MichaelCurrin/cheatsheets)' | markdownify }}

</footer>
```

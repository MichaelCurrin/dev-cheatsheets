# Tips


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

## Sitemap

Using Jekyll Sitemap plugin, the `sitemap.xml` file is created on prod and dev builds, but the `url` in the config will only be used on a prod build. Otherwise it will just be localhost in the sitemap.
<!--stackedit_data:
eyJoaXN0b3J5IjpbNzIyNTUxMjM3XX0=
-->
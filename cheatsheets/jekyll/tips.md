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

If you not using SEO tag


The layout must be null otherwise it will use default.

```markdown
---
layout: null
---
User-agent: *
Sitemap: {{ site.url }}/sitemap.xml
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMjY0OTA4NzA2XX0=
-->
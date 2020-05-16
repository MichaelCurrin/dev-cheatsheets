# Permalinks cheatsheet

## Resources

- [Jekyll Permalinks doc](https://jekyllrb.com/docs/permalinks/)


## Page-specific

Override the permalink on a page in the frontmatter.

```
---
permalink: /about/
---

```

## Global


Pages and collections (excluding posts and drafts) don’t have time and categories. These aspects of the permalink style are ignored for the output.

For pages, the `:title` is equivalent to `:basename`.

**Permalink Patterns**  
Jekyll allows you to redefine the entire default pattern in the `_config.yml` This will affect both pages and posts with one important distinction: posts have access to categories and date and time elements from the Front Matter, while pages do not. Page URLs will follow the pattern, gracefully omitting any post-specific elements.

### Built-in

[source](https://jekyllrb.com/docs/permalinks/#built-in-formats)

Jekyll uses `permalink: pretty` by default`.

| Shortcut | Result |
|--|--|
| `date` | `/:categories/:year/:month/:day/:title:output_ext` |
| `pretty` | `/:categories/:year/:month/:day/:title/` |
| `ordinal` | `/:categories/:year/:y_day/:title:output_ext` |
| `weekdate` | `/:categories/:year/W:week/:short_day/:title:output_ext` |
| `none` | `/:categories/:title:output_ext`


## Custom

```
permalink: /:categories/:year/:month/:day/:title:output_ext
```

## Collection-level

collections:
  my_collection:
    output: true
    permalink: /:collection/:name
<!--stackedit_data:
eyJoaXN0b3J5IjpbNzc1NDM2NjY4XX0=
-->
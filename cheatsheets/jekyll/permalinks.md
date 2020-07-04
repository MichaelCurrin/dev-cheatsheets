---
title: Permalinks
---

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

Note that all values are always added in a single permalink pattern - they just might not be set. e.g. date and categories are only on posts (note categories can be nested in output path).

[source](https://jekyllrb.com/docs/permalinks/#built-in-formats)

Choose one of the builtin values.

| Shortcut   | Result                                                   |
| ---------- | -------------------------------------------------------- |
| `date`     | `/:categories/:year/:month/:day/:title:output_ext`       |
| `pretty`   | `/:categories/:year/:month/:day/:title/`                 |
| `ordinal`  | `/:categories/:year/:y_day/:title:output_ext`            |
| `weekdate` | `/:categories/:year/W:week/:short_day/:title:output_ext` |
| `none`     | `/:categories/:title:output_ext`                         |


### Custom

Make sure not to remove categories and year/month/day otherwise your posts will not work. Unless you don't have posts.

### Remove extension

This will remove the default `.html` from pages.
```yaml
permalink: /:categories/:year/:month/:day/:title
```

### Add trailing forward-slash

This will change output files `about.html` to `about/index.html`.

```yaml
permalink: /:categories/:year/:month/:day/:title/
```

When you link to a page in your content, you'll want to make sure you link to the short form and not the explict `index.html` version.

## Collection-level

```
collections:
  my_collection:
    output: true
    permalink: /:collection/:name
```

## Page attributes

| Variable       | Value                                                                                          |
| -------------- | ---------------------------------------------------------------------------------------------- |
| `:path`        | Path to the page relative to the site's source directory, excluding base filename of the page. |
| `:basename`    | The page's base filename                                                                       |
| ` :output_ext` | Extension of the output file. (Included by default and usually unnecessary.)                   |

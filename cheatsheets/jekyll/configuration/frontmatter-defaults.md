---
description: About the `defaults` field for setting default values on the frontmatter pages
---
# Frontmatter defaults

See [Frontmatter defaults](https://jekyllrb.com/docs/configuration/front-matter-defaults/) in the docs.

Example syntax:

```yaml
defaults:
  - scope:
      type: "bar"
    values:
      layout: "bazz"
      fizz: "Buzz"

  - scope:
      path: "_pages"
    values:
      layout: "page"

  - scope:
      path: ""
    values:
      layout: "default"
```

Use type for collections.

Later matches will override earlier matches.

Use the fallback option last.

Path can also be like:

```yaml
path: "_foo/*/index.md"
```

Warning: You will get performance issues if you use double globstar (`**`) in your pattern due to a Jekyll limitation, but one (`*`) is okay.

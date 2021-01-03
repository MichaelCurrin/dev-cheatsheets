---
description: About the `defaults` field for setting default values on the frontmatter pages
---
# Frontmatter defaults

See [Frontmatter defaults](https://jekyllrb.com/docs/configuration/front-matter-defaults/) in the docs.

These values get set as defaults on pages, posts and collections. The values on an actual page's frontmatter take preference.


## Example syntax

```yaml
defaults:
  - scope:
      path: "_foo"
      type: "foo"
    values:
      layout: "bazz"
      fizz: "Buzz"

  - scope:
      path: "_baar"
    values:
      layout: "page"

  - scope:
      path: ""
    values:
      layout: "default"
```

Use `type` for collections. It might be better to use `path` and `type` together here - need to check.

Later matches will override earlier matches.

Use the fallback option last.


## Path

Use this to match all pages.

```yaml
path: ""
```

Path can also be like:

```yaml
path: "_foo/*/index.md"
```

I don't know if `_foo/*` is different to just `_foo`. Maybe the latter goes all levels down and not just one.

Warning: As covered in the docs, you will get performance issues if you use double globstar (`**`) in your pattern due to a Jekyll limitation, but one (`*`) is okay.

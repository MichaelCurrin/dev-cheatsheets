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
      type: "foo"
    values:
      layout: "bazz"
      fizz: "Buzz"

  - scope:
      path: "_bar"
    values:
      layout: "page"

  - scope:
      path: ""
    values:
      layout: "default"
```

Use `type` for collections, such as the `foo` collection or `posts` collection (yes, posts are also in `site.collections`.


## Ordering

Later matches will override earlier matches.

Use your fallback option _last_.


## Path

Use this to match _all_ pages.

```yaml
path: ""
```

Path can also be like:

```yaml
path: "_foo/*/index.md"
```

I don't know if `_foo/*` is different to just `_foo`. Maybe the latter goes all levels down and not just one.

**Warning:** As covered in the docs, you will get performance issues if you use double globstar (`**`) in your pattern, due to a Jekyll limitation. But one globstar (`*`) is okay.

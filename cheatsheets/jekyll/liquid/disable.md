---
title: Disable
description: How to prevent Liquid code from being evaluated
---


## Metadata

See [Tags Filters](https://jekyllrb.com/docs/liquid/tags/) in the Jekyll docs.

Set in frontmatter (Jekyll 4.X only):

```yaml
---
title: Foo
render_with_liquid: false
---
```

## Raw tag

Use the `raw` tag around a text, a line, multiple lines, or most of the file.

Note shown here as it is not practical to get the `raw` tag to appear literally.

If you want the `raw` tag to appear literally, you can use `render_with_liquid` (Jekyll 4.X) for the file. Nesting `raw` tags might not work as the inner `endraw` will close the outer `raw`.

An example can't be shown here, because you can't nest raw tags. The inner closing tag for display purposes will end the outer opening tag.

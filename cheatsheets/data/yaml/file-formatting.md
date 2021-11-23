# File formatting

## Extension

Use `.yml` or `.yaml` extension.


## Start of file

YAML files strictly should start with triple dash, but in practice this is only used sometimes.

e.g.

```yaml
my_string: Hello
```

```yaml
---
my_string: Hello
```

For a Jekyll site:

```yaml
---
title: Hello
my_string: Greetings
---

My page content.
```

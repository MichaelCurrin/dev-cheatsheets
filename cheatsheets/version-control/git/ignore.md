---
description: Reference for the Git ignore file
---
# Ignore


## Paths and nesting

### File at all levels

Ignores foo at all levels

```
foo
```

### Fixed path

Ignores `foo` at `/fizz/foo` in the repo root.

```
fizz/foo
```

This does **not** ignore a path like `abc/fizz/foo`, so see below.

### Path at any level

ignores foo at fizz/foo, abc/fizz/foo, etc.

```
*/fizz/foo
```


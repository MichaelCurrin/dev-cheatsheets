---
description: Reference for the Git ignore file
---
# Ignore


## Paths and nesting

### File at all levels

Ignores `foo` at any location.

```
foo
```

### Fixed path

Ignores `foo` only the root `fizz` directory.

```
fizz/foo
```

This does **not** ignore a path like `abc/fizz/foo`, so see below.

### Path at any level

Ignores `foo` in any `fizz` directory at any level in the directory hierarchy.

e.g. `fizz/foo`, `abc/fizz/foo`.

```
*/fizz/foo
```

## Extension

Using the same rules as above but for a `.foo` file:

- **`*.foo`**: Ignores all files with the `.foo` extension, regardless of their directory.
- **`fizz/*.foo`**: Ignores files with the `.foo` extension only in the `fizz` directory at the root of the repository.
- **`*/fizz/*.foo`**: Ignores files with the `.foo` extension in any `fizz` directory, no matter where the `fizz` directory is located within the repository.


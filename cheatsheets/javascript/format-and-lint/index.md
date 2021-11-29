---
description: Formatting and linting JavaScript files
---
# Format and lint

See also [Format and lint](https://michaelcurrin.github.io/code-cookbook/recipes/javascript/format-and-lint/) section of my Cookbook.


### Ignore summary

### ES Lint

Ignore linting rule on same line.

```javascript
console.log("Hello, World"); // eslint-disable-line no-console
```

### Prettier

Ignore formatting rule on next line.

```javascript
// prettier-ignore
console.log("Hello, World")
```

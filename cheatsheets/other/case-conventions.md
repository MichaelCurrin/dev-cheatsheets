# Case conventions
> How to use the right case when naming objects in a language

## Styles

An overview of the main naming styles in use.

- `snake_case` - [Wikipedia](https://en.wikipedia.org/wiki/Snake_case)
- `SCREAMING_SNAKE_CASE` - i.e. all caps, with underscores.
- `camelCase` - [Wikipedia](https://en.wikipedia.org/wiki/Camel_case)
- `PascalCase`
- `kebab-case`


## Languages

Language          | Variable               | Function                    | Class
---               | ---                    | ---                         | ---
Bash              | `SCREAMING_SNAKE_CASE` | `snake_case`                | n/a
Python, Ruby      | `snake_case`           | `snake_case`                | `PascalCase`
JavaScript, Java  | `camelCase`            | `camelCase`                 | `PascalCase`
Go                | `camelCase`            | `camelCase` or `PascalCase` | There is no `class` object .
PHP               | `$camelCase`           | `camelCase`                 | `PascalCase`

### Notes

- Not covered in the table is global constants, which is mostly using `SCREAMING_SNAKE_CASE`.
- For filenames, `kebab-case` used sometimes but usually it is `snake_case` like for Python, Ruby or Bash. JavaScript is usually `camelCase`, though module which contains only a class is named after that e.g. `MyClass.js` contains `MyClass`. In React your have `Component.jsx` and in Vue it is `MyComponent.vue`.
- In HTML/CSS/JS, an element ID or class is usually named with `kebab-case`.

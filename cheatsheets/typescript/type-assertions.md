# Type assertions

Based on the [docs](https://www.typescriptlang.org/docs/handbook/basic-types.html#type-assertions)

Below we convert from a string to a number.

## As syntax

```typescript
const foo = "this is a string";
const len = (foo as string).length;
```

## Angle-bracket syntax

Does not work with JSX syntax.

```typescript
const foo = "this is a string";
const len = (<string> foo).length;
```

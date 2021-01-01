# Type assertions

Based on the [Type assertions](https://www.typescriptlang.org/docs/handbook/basic-types.html#type-assertions) part of the docs

Below we convert or cast from a string to a number. 

This is useful when a value could have multiple types and you tell the compiler which one is in use here.


## The as syntax

```typescript
const foo = "this is a string";
const len = (foo as string).length;
```


## Angle-bracket syntax

Same as above but not work with JSX syntax.

```typescript
const foo = "this is a string";
const len = (<string> foo).length;
```

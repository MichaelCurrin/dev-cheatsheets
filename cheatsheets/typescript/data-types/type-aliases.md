
# Type aliases

See [Type aliases](https://www.typescriptlang.org/docs/handbook/advanced-types.html#type-aliases) under Advanced Types in the docs.

> Type aliases create a new **name** for a type. Type aliases are sometimes similar to interfaces, but can name primitives, unions, tuples, and any other types that you’d otherwise have to write by hand.

> Aliasing doesn’t actually create a new type - it creates a **new name** to refer to that type. Aliasing a primitive is **not terribly useful**, though it can be used as a form of documentation.


## Format

```typescript
type VARIABLE_NAME = TYPE
```


## With primitives

```typescript
type Second = number;

let timeInSecond: number = 10;
let time: Second = 10;
```

## With a union

```typescript
type Fuzz = string | boolean
```


## As a data structure

```typescript
type Animal = {
  name: string
}
```


## With types

```typescript
type Foo = {
  name: "string"
};

type Bar = {
  name: "string"
};

type Person = Foo | Bar;
```


## With interfaces

```typescript
interface Foo {
  name: "string"
};

interface Bar {
  name: "string"
};

type Person = Foo | Bar;
```

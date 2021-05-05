# Type aliases

Alias a type to give a name to a simple or basic type. Then use it around your codebase for readability and to enforce that check.

See [Type aliases](https://www.typescriptlang.org/docs/handbook/advanced-types.html#type-aliases) under Advanced Types in the docs.

> Type aliases create a new **name** for a type. Type aliases are sometimes similar to interfaces, but can name primitives, unions, tuples, and any other types that you’d otherwise have to write by hand.

> Aliasing doesn’t actually create a new type - it creates a **new name** to refer to that type. Aliasing a primitive is **not terribly useful**, though it can be used as a form of documentation.


## Format

Use the `type` keyword. In a typed language, I've seen `type alias` instead.

```typescript
type VARIABLE_NAME = TYPE
```

Where `TYPE` can be primitive, union of types, etc. See below.


## Examples

### With primitives

```typescript
type Second = number;
```

These two statements are then equivalent:

```typescript
let time: number = 10;
let time: Second = 10;
```

### Data structures

Create an array of strings.

```typescript
type pets = string[]
```

Create key-value pairs.

```typescript
type Animal = {
  name: string
  color: string
}
```

### With a union

```typescript
type Fuzz = string | boolean
```

#### With other type aliases

Here we use a union of type aliases

```typescript
type Foo = {
  name: string
};

type Bar = {
  name: string
};

type Person = Foo | Bar;
```

#### With interfaces

Here we use a union of interfaces.

```typescript
interface Foo {
  name: string
};

interface Bar {
  name: string
};

type Person = Foo | Bar;
```

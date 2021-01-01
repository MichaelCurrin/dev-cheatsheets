# Validation


## Allowed values

Note on sections below.

If the input is from a user like a form, then you need to cast a string to the right type. This doesn't guarantee the value though, so you might need your own input validation or throw an error.

```typescript
foo(fruitInput as Fruit)
```

### Enum

```typescript
enum Fruit  {
  Apple = "apple",
  Banana = "banana"
}

function foo(fruit: Fruit) {
  console.log(fruit)
}

foo(Fruit.Apple)
// apple
foo(Fruit.Banana)
// banana

foo("")
// Argument is not of type Fruit so is not allowed.
```


### Type

Use a type definition to limit inputs to certain values.

```typescript
type Fruit = "apple" | "banana";

function foo(fruit: Fruit) {
  console.log(fruit)
}

foo("apple")
// apple
foo("banana")
// banana

foo("")
// Argument is not of type Fruit so is not allowed.
```

Unfortunately you can't use the type inline in the function as `fruit: "apple" | "banana"` as that sees as binary operator and the type gets seen as `boolean | undefined`.


## Required and optional values

### Make optional

Use the **question mark** to indicate a key must be set.

```typescript
type Foo = {
  foo?: string;
  bar: string;
};
```

Or in a function. Optional values must go last.

```typescript
function Foo(bar: string, foo?: string) {
}
```

Or

```typescript
function Foo(bar: string, foo = "") {
}
```

### Check required value is not empty

The value might still be null though, such as `""`.

So then you need your own check.

```typescript
if (!foo) {
  throw new Error("`foo` may not be null");
}
```

### Required to optional

If you have a type where a value is optional, you can make it required later using an exclamation mak.

```typescript
type Foo = {
  foo: string;
  bar?: string;
};
```

function bazz(myMap: Foo) {
  const newMap = {
    foo: foo,
    bar: bar!
  }
}

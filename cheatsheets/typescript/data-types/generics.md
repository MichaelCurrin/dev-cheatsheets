# Generics

See [Generics](https://www.typescriptlang.org/docs/handbook/generics.html) in the handbook.

As in C# and Java, you can create a component that can work over a variety of types which makes them resuable.

Rather than setting a type like `number` or using `any`, you can let the type be defined based on the usecase.


## Type alias

```typescript
type Container<T> = { value: T };
```


## Function

```typescript
function identity<T>(arg: T): T {
  return arg;
}
```

You can use like this:

```typescript
let foo = identity("bar");
```

Which implies:

```typescript
let foo: string = identity<string>("bar")
```

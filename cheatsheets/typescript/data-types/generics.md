# Generics

## Resources

- [Generics](https://www.typescriptlang.org/docs/handbook/2/generics.htm) in the handbook.
 
As in C# and Java, you can create a component that can work over a variety of types, which makes them resuable.


## Function

From the handbook.

Instead of setting the type as say `number` or `any`.

```typescript
function identity(arg: number): number {
  return arg;
}
```

You can let it be dynamic.

```typescript
function identity<Type>(arg: Type): Type {
  return arg;
}
```

You can use like this:

```typescript
let foo = identity("bar");
```

Which implies passing the type `string` as the value of `T`.

```typescript
let foo: string = identity<string>("bar")
```


## Type alias

You can create a generic type.

Here is an array which can have any type of item inside it.

```typescript
type MyTypeAlias<T> = Array<T>
```

Or a hash.

```typescript
type Container<T> = { myKey: T };
```


## Examples

## Equals

Check if all items in an array are equal.

```typescript
function equal<Type>(items: Array<Type>) {
  return items.every(i => i === items[0]) 
}
```

Pass an array of numbers.

```
const x = [1, 1, 1]
equal(x)
// true

const y = [1, 2, 3]
equal(x)
// false
```

Pass an array of strings or of mixed types.

```typescript
equal(["1", "1", "1"])
// true
equal(["1", "1", 1])
// true
```

If you want to enforce all the types be equal, then pass the type explicitly.

```typescript
equal<string>(["1", "1", 1])
// Argument of type '(string | number)[]' is not assignable to parameter of type 'string[]'.
//  Type 'string | number' is not assignable to type 'string'.
//    Type 'number' is not assignable to type 'string'.
```

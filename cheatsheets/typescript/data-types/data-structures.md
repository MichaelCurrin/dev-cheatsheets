# Data structures


## Array

```typescript
string[]
number[]
```

Or the longer:

```typescript
Array<string>
Array<number>
```


## Tuple

```typescript
[string, number]
```

Example:

```typescript
type Foo = [string, number]
```

Inside an interface.

```typescript
interface Foo {
  value: [string, number]
}
```


## Dictionary
> aka a map or hash or associative array

```typescript
let foo: { [s: string]: string } = {}
```

```typescript
type Name = string | string[]
```

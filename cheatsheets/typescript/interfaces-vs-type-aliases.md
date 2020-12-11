# Interfaces vs Types aliases

See the [Type aliases](#type-aliases) and [Interfaces](#interfaces) sections sections.

See [blog post](https://blog.logrocket.com/types-vs-interfaces-in-typescript/).

Examples from [docs](https://www.typescriptlang.org/docs/handbook/advanced-types.html#interfaces-vs-type-aliases)

## Extending

## Extend an interface

```typescript
interface Animal {
  name: string
}

interface Bear extends Animal {
  honey: boolean
}

const bear = getBear()
bear.name
bear.honey
```

## Extend a type via intersections

```typescript
type Animal = {
  name: string
}

type Bear = Animal & {
  honey: Boolean
}

const bear = getBear()
bear.name
bear.honey
```

Combine two types.

```typescript
type Name = {
  name: "string"
};

type Age = {
  age: number
};

type Person = Name & Age;
```

Combine two interfaces. You can't reverse this as an interface made of two types.

```typescript
interface Name {
  name: “string”
};

interface Age {
  age: number
};

type Person = Name & Age;
```


## Adding fields

Declare an interface multiple types and they will all be collapsed into one.

```typescript
interface Window {
  title: string
}

interface Window {
  ts: import("typescript")
}

const src = 'const a = "Hello World"';
window.ts.transpileModule(src, {});
```

You get an error if you do that with types.

```typescript
// Error: Duplicate identifier 'Window'.
```

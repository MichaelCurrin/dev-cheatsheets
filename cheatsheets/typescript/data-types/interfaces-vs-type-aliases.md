# Interfaces vs Types aliases


## Related sections

- [Type Aliases][] cheatsheet.
- [Interfaces][] cheatsheet.

[Type Aliases]: {% link cheatsheets/typescript/data-types/type-aliases.md %}
[Inferfaces]: {% link cheatsheets/typescript/data-types/interfaces.md %}


## Resources

- [Types vs Interfaces in TypeScript](https://blog.logrocket.com/types-vs-interfaces-in-typescript/) blog post.
- [Inferfaces vs Type Aliases](https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#differences-between-type-aliases-and-interfaces) in TS docs.


## Choosing one

Type aliases and interfaces are very similar.

Type has more features, but most of their features are the same.

The key distinction is:

- A `type` cannot be re-opened to add new properties.
- An `interface` which is always extendable.

Which one to use? The docs say you can choose based on personal preference and the compiler will tell you if it needs something else.
And gives a recommendation to you use `interface` (with fewer feature), until you need to use a feature specific to `type`.


## Extending

### Extend an interface

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

### Extend a type via intersections

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
  name: "string"
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

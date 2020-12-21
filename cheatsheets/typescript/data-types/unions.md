# Unions

See [Union and intersections](https://www.typescriptlang.org/docs/handbook/unions-and-intersections.html) in the docs.

See the sections in this guide on [Type aliases](#type-aliases) and [Intersections](#intersections).

Declare a set of allowed types.

```typescript
string | boolean
```

For example, allow a variable to be of allowed types so you assign to either or even change.

```typescript
let foo: string | boolean;
foo = 'a';
foo = 10;
```

TypeScript infers types on initialization, not assignment.

So this is valid but won't give you any validation or intellisense as the type of `foo` is `any`.

```typescript
let foo;
foo = 10;
foo = 'a';
```

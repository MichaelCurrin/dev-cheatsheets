# Interfaces


## Inline

```typescript
function foo(bar: { bazz: string }) {
  console.log(bar.bazz)
}

// Note the semicolon.
function foo(): { a: string; b?: number } {
}
```

## Explicit

Define an interface then use it later.

```typescript
interface Bar {
  bazz: string
}

function foo(bar: Bar) {
  console.log(bar.bazz)
}
```

You can define in the file where it is used as above, or export it in a `.d.ts` type definitions file.

```typescript
export interface Bar {
  bazz: string
}
```

Set an optional key:

```typescript
interface Bar {
  bazz?: string
}
```

Make it read-only.

```typescript
interface Bar {
  readonly bazz: string
}
```

```typescript
interface Bar {
  bazz: string[] // array
  buzz: { [key: string]: string } // dictionary
}
```

You can extract a type from an interface.

```typescript
interface Building {
  room: {
    door: string,
    walls: string[],
  };
}

// string[]
type Walls = Building['room']['walls'];
```

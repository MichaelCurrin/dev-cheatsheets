# Validation

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

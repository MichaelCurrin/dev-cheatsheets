
# Functions


## Basic

Set the type of each parameter.

```typescript
function foo(a: number, b: number): number {
  return a + b
}
```

And set optionally the return type - it it can be inferred from the functions called within, but you may want to enforce that the encounter function returns a certain type when the the internal functions change.

```typescript
function foo(a: number): string {
  return fizz(a)
}
```

Optional types with `?` must be last.

```typescript
function foo(message: string, color = "blue", label?: string) {}
```


## Convert to named arguments

```typescript
function foo(message: string, color: string, label?: string) {}
```

Using VS Code to convert to a destructured object.

```typescript
function foo({ message, color, label }: { message: string; color: string; label?: string; })
```

Note use of semicolons.

Note that simply using the last part would be valid:

```typescript
{ message: string; color: string; label?: string; }
```

Although this looks like a case for breaking out a separate type or interface, especially if it is resuable.

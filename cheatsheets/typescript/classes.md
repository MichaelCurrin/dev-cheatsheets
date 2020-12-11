# Classes

```typescript
class Point {
  x: number
  y: number
  static instances = 0

  constructor(x: number, y: number) {
    this.x = x
    this.y = y
  }
}
```

Or with shorthand:

```typescript
class Point {
  static instances = 0

  constructor(
    public x: number,
    public y: number,
  ){}
}
```

This field does not require initialization. I don't know `!` differs from `?` and when you would use this.

```typescript
class Point {
  public someUselessValue!: number;
  // ...
}
```

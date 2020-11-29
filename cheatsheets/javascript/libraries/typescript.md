# TypeScript

- [TypeScript Cheatsheet](https://devhints.io/typescript) on DevHints.

See also my [TypeScript](https://github.com/MichaelCurrin/learn-to-code/tree/master/en/topics/scripting_languages/TypeScript) guid.


## Data types

### Basic

```typescript
any
void

boolean
number
string

null
undefined

never  /* unreachable */
```

### Data structures

#### Array

```typescript
string[]
// Or
Array<string>
```

#### Tuple

```typescript
[string, number]
```

#### Dictionary

```typescript
let foo: { [s: string]: string } = {}
```

```typescript
type Name = string | string[]
```

#### Enum

```typescript
const enum Color {
  Red, 
  Green, 
  Blue = 4
}

const a: Color = Color.Green

const b: Color = Color['Green']
```

If you try and lookup with a variable, you get an error.

> A const enum member can only be accessed using a string literal.

```typescript
const x = 'Green'
const c: Color = Color[x]
```

You can use a function wrapper though.

```typescript
import { DESCRIPTION } from './constants';

type DescriptionStrings = keyof typeof DESCRIPTION;

export function describeCode(key: DescriptionStrings) {
  return DESCRIPTION[key];
}

// Usage:
describeCode('Foo')
```


### Unions

A set of allowed types.

```typescript
string | boolean
```

You can define that as a named type and then use it later.

```typescript
type Foo = string | boolean
```

### Declare a variable

Set type initially then change value.

```typescript
let foo: boolean
foo = true
```

Or:

```typescript
let foo = true
```
Types can be inferred but you can also do:

```typescript
let foo: boolean = false
```


## Functions

Return type is optional.

```typescript
function foo(a: number, b: number): number {
  return a + b
}
```


Optional types must be last.

```typescript
function foo(message: string, color = "blue", label?: string) {}
```

### Convert to named arguments

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
 

## Type assertions

```typescript
let len: number = (input as string).length

let len: number = (<string> input).length 
```


## Interfaces

### Inline

```typescript
function foo(bar: { bazz: string }) {
  console.log(bar.bazz)
}

// Note the semicolon.
function foo(): { a: string; b?: number } {
}
```

### Explicit

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

Make it readonly.

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


## Classes

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

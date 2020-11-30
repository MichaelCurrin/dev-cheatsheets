# TypeScript

- [TypeScript Cheatsheet](https://devhints.io/typescript) on DevHints.

See also my [TypeScript](https://github.com/MichaelCurrin/learn-to-code/tree/master/en/topics/scripting_languages/TypeScript) guid.


## CLI

Command:

```sh
$ tsc
```

Options. these are set in the terminal but you can set in the config too.

Option              | Description
---                 | ---
`-p .`              |  Set the _project_ directory. Here as the top-level directory (not `src`). A TS config must exist here. You can run `tsc foo.ts` if you prefer.
`--outDir dist`     | Output to given directory rather than the same directory as the source file. Note the directory is **not** cleared each time, so you might want to run `rm -rf dist && tsc -p . --outDir dist`.
`--sourceMap false` | If you don't want `.map` files, you can turn this off like this.
`--rootDir src`     | You probably don't need to set this. If you do an import from outside `src` such as to `../../package.json` then you end up changing the root directory and then have to set this param or change the import.


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

See the [Enum](https://www.typescriptlang.org/docs/handbook/enums.html) section in the TS docs. This can get complicated for dynamic lookup. In particular see the [const enums](https://www.typescriptlang.org/docs/handbook/enums.html#const-enums) section.

```typescript
enum COLOR {
  Red, 
  Green, 
  Blue = 4
}
```

Lookup with attribute.

```typescript
const a: COLOR = COLOR.Green;
```

Lookup with literal.

```typescript
const b: COLOR = COLOR['Green'];
```

Lookup by variable. Only works if the enum declaration is **not** done with `const`.

> A const enum member can only be accessed using a string literal.

```typescript
const x = 'Green'
const c: COLOR = COLOR[x]
```

When the input variable is dynamic like controlled by the UI, I had to change the approach to casting.

Using `VAR as TYPE`. Or `<TYPE> VAR`. From [StackOverflow](https://stackoverflow.com/questions/37978528/typescript-type-string-is-not-assignable-to-type).

```typescript
export type Fruit = "Orange" | "Apple" | "Banana";
let myString: string = "Banana";

let myFruit: Fruit = myString as Fruit;

// Newer syntax.
let fruit = "Banana" as const;
```

Here in my Vue case, where `this.color` is setup in `data` method.

```typescript
export enum Color {
  Red = 'red',
  Green = 'green'
}

const key = this.color as keyof typeof Color;
const color = Color[key];
```

This is more effective and less code than alternatives below.

This doesn't work when key is dynamic.

```typescript
enum COLOR {
  Red = 'red',
  Green = 'green'
}

const key = 'Green';
const bar = (<any>COLOR)[key];
```
I've also come across using a wrapper.
```typescript
enum COLOR {
  Red = 'red',
  Green = 'green'
}

type ColorStrings = keyof typeof COLOR;

function describeColor(key: ColorStrings) {
  return COLOR[key];
}

const key = 'Red';
const bar = describeColor(key);
```

But it wasn't effective until I did this. Which is the casting approach and means the intermediate function is a waste.

```typescript
const bar = describeColor(key as ColorStrings);
```

Getting the `type` of an enum. From the docs.

```typescript
enum LogLevel {
  ERROR,
  WARN,
  INFO,
  DEBUG,
}

type LogLevelStrings = keyof typeof LogLevel;
// 'ERROR' | 'WARN' | 'INFO' | 'DEBUG';


function printImportant(key: LogLevelStrings, message: string) {
  const num = LogLevel[key];
  if (num <= LogLevel.WARN) {
    console.log("Log level key is:", key);
    console.log("Log level value is:", num);
    console.log("Log level message is:", message);
  }
}
printImportant("ERROR", "This is a message");
```

Reverse mapping based on the docs. From the docs.

```typescript
enum COLOR {
  Red,
}

const c = Enum.Red;
const nameOfRed = Enum[c]; // "Red"
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

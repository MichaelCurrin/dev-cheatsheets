---
logo: typescript
---
# TypeScript


## Resources

- [TypeScript Cheatsheet](https://devhints.io/typescript) on DevHints.
- My [TypeScript](https://github.com/MichaelCurrin/learn-to-code/tree/master/en/topics/scripting_languages/TypeScript) guide.
- TS docs
    - [Basic types](https://www.typescriptlang.org/docs/handbook/basic-types.html)
    - [Interfaces](https://www.typescriptlang.org/docs/handbook/interfaces.html) - type checking based on the _shape_ of the data.
    - [Enums](https://www.typescriptlang.org/docs/handbook/enums.html)
    - [Advanced types](https://www.typescriptlang.org/docs/handbook/advanced-types.html) - including type guards, nullable types, conditional types.
    - [Triple-slash directive](https://www.typescriptlang.org/docs/handbook/triple-slash-directives.html) - `/// <reference path="..." />`

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
unknown

never  /* unreachable */
```

#### Unknown

```typescript
let foo: unknown = 4;
foo = "maybe a string instead";
foo = false;
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

I've also come across using a wrapper function. 

```typescript
enum COLOR {
  Red = 'red',
  Green = 'green'
}

type ColorStrings = keyof typeof COLOR;

function describeColor(key: ColorStrings) {
  return COLOR[key];
}
// OR
export function describeCode(key: string) {
  return DESCRIPTION[key as DescriptionKeys];
}


const key = 'Red';
const bar = describeColor(key);
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

See [Union and intersections](https://www.typescriptlang.org/docs/handbook/unions-and-intersections.html) in the docs.

See the sections in this guide on [Type aliases](#type-aliases) and [Intersections](#intersections).

Declare a set of allowed types.

```typescript
string | boolean
```

You can define that as a named type and then use it later.

```typescript
type Fuzz = string | boolean
```

Examples:

```typescript
type Foo = {
  name: "string"
};

type Bar = {
  name: "string"
};

type Person = Foo | Bar;
```

```typescript
interface Foo {
  name: "string"
};

interface Bar {
  name: "string"
};

type Person = Foo | Bar;
```

### Type aliases

See [Type aliases](https://www.typescriptlang.org/docs/handbook/advanced-types.html#type-aliases) under Advanced Types in the docs.

> Type aliases create a new **name** for a type. Type aliases are sometimes similar to interfaces, but can name primitives, unions, tuples, and any other types that you’d otherwise have to write by hand.

> Aliasing doesn’t actually create a new type - it creates a **new name** to refer to that type. Aliasing a primitive is **not terribly useful**, though it can be used as a form of documentation.

#### Basic

Format:

```typescript
type VARIABLE_NAME = TYPE
```

Using a primitive.

```typescript
type Second = number;

let timeInSecond: number = 10;
let time: Second = 10;
```

Using a data structure.

```typescript
type Animal = {
  name: string
}
```

#### Generic

```typescript
type Container<T> = { value: T };
```


## Declare a variable

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

Based on the [docs](https://www.typescriptlang.org/docs/handbook/basic-types.html#type-assertions)

Below we convert from a string to a number.

### As syntax

```typescript
const foo = "this is a string";
const len = (foo as string).length;
```

### Angle-bracket syntax

Does not work with JSX syntax.

```typescript
const foo = "this is a string";
const len = (<string> foo).length;
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


## Interfaces vs Types aliases

See the [Type aliases](#type-aliases) and [Interfaces](#interfaces) sections sections.

See [blog post](https://blog.logrocket.com/types-vs-interfaces-in-typescript/).

Examples from [docs](https://www.typescriptlang.org/docs/handbook/advanced-types.html#interfaces-vs-type-aliases)

### Extending

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
  name: “string”
};

interface Age {
  age: number
};

type Person = Name & Age;
```


### Adding fields

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

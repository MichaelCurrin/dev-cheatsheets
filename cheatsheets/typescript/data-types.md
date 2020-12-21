
# Data types

## Basic

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

### Unknown

```typescript
let foo: unknown = 4;
foo = "maybe a string instead";
foo = false;
```


## Data structures

### Array

```typescript
string[]
// Or
Array<string>
```

### Tuple

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

### Dictionary

```typescript
let foo: { [s: string]: string } = {}
```

```typescript
type Name = string | string[]
```

### Enum

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


## Unions

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


## Type aliases

See [Type aliases](https://www.typescriptlang.org/docs/handbook/advanced-types.html#type-aliases) under Advanced Types in the docs.

> Type aliases create a new **name** for a type. Type aliases are sometimes similar to interfaces, but can name primitives, unions, tuples, and any other types that you’d otherwise have to write by hand.

> Aliasing doesn’t actually create a new type - it creates a **new name** to refer to that type. Aliasing a primitive is **not terribly useful**, though it can be used as a form of documentation.

### Basic

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

### Generic

```typescript
type Container<T> = { value: T };
```


### Types alias of primitives

```typescript
type Fuzz = string | boolean
```

### Type alias of types

```typescript
type Foo = {
  name: "string"
};

type Bar = {
  name: "string"
};

type Person = Foo | Bar;
```

### Type alias of interfaces


```typescript
interface Foo {
  name: "string"
};

interface Bar {
  name: "string"
};

type Person = Foo | Bar;
```

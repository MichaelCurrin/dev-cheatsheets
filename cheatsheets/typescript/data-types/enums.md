# Enums

See the [Enum](https://www.typescriptlang.org/docs/handbook/enums.html) section in the TS docs. This can get complicated for dynamic lookup. 

There are 3 types of enum - numeric, string and heterogenous.

Note - I couldn't get an `enum` to export from a `.d.ts` file, but it works fine in `.ts` file.


## Naming convention

Use uppercase letters for your enums - they are global constants which have usable values. They are more than just types, which use usually like `Foo` or `TFoo`.

The keys on an enum tend to be titlecase.


## Using an object an alternative to enums

If you run into limitations using an enum (especially the string one), you can fallback to using a dictionary instead. You don't get the enum features, but you can get the safety and intellisense of looking up fixed values on an object.

e.g.

```typescript
const COLOR = {
  Red: "red",
  Blue: "blue",
  Green: "green",
}

COLOR.Red
```

Just remember thhat you can't use a value internally here, like `BLUE: this.RED` (Error that the Object might be undefined) or `BLUE: COLOR.RED` (used before declaration).


## Numeric enum

The first value has a value of zero and then values increment.

```typescript
enum COLOR {
  Red,   // 0
  Green, // 1
  Blue = 4
}
```

<details>
<summary>Compiled JS result</summary>

```javascript
"use strict";
var COLOR;
(function (COLOR) {
    COLOR[COLOR["Red"] = 0] = "Red";
    COLOR[COLOR["Green"] = 1] = "Green";
    COLOR[COLOR["Blue"] = 4] = "Blue";
})(COLOR || (COLOR = {}));
```

</details>

See what the enum is defined as.

```javascript
> COLOR
{
  "0": "Red",
  "1": "Green",
  "4": "Blue",
  "Red": 0,
  "Green": 1,
  "Blue": 4
}
```

If you override the first value, the others follow it.

```typescript
enum COLOR {
  Red = 1,
  Green,   // 2
  Blue     // 3
}
```

### Lookup key

```typescript
> COLOR[0]
"Red"
```

### Lookup value

Note that when you get a value on this enum, the type is `COLOR`, not string or number.

Lookup by attribute.

```typescript
COLOR.Red;
// 0
```

Lookup by string.

```typescript
COLOR['Red'];
// 0
```

Lookup by variable. Only works if the enum declaration is **not** done with `const`.

> A const enum member can only be accessed using a string literal.

```typescript
const x = 'Green'
COLOR[x]
// 0
```


## String enum

```typescript
enum StrangerThings {
  Character = "Eleven",
  Father = "Hopper",
  Power = "Telekenesis",
  Town = "Hawkins"
}
```

<details>
<summary>Compiled JS result</summary>

```javascript
"use strict";
var StrangerThings;
(function (StrangerThings) {
    StrangerThings["Character"] = "Eleven";
    StrangerThings["Father"] = "Hopper";
    StrangerThings["Power"] = "Telekenesis";
    StrangerThings["Town"] = "Hawkins";
})(StrangerThings || (StrangerThings = {}));
```

</details>

### Lookup key

```typescript
StrangerThings.Power
// "Telekenesis"
```

### Lookup value

```typescript
StrangerThings.Character
// "Eleven"
```


## Heterogenous enum

```typescript
enum StrangerThings {
  Character = "Eleven",
  Father = "",
  Power = "Telekenesis",
  age = 15
}
```


## Dynamic lookup

When the input variable is dynamic like controlled by the UI, I found had to change the approach to casting.

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


## Enum for function types

Getting the keys of an enum. From the docs.

```typescript
enum LogLevel {
  ERROR,
  WARN,
  INFO,
  DEBUG,
}

type LogLevelStrings = keyof typeof LogLevel;
// 'ERROR' | 'WARN' | 'INFO' | 'DEBUG';
```

Continuing below, we enforce that the key must be a string that matches the keys of the enum.

```typescript
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

You could also use `level: LogLevel` in place of the key, but then the function caller must pass in an enum value and not a string.


## Reverse mapping

Reverse mapping - based on a value, get the name of the key. Based on the docs example.

```typescript
enum COLOR {
  Red,
}

const c = COLOR.Red;
// 0

const nameOfRed = COLOR[c];
// "Red"
```


## Constant enums

See the [const enums](https://www.typescriptlang.org/docs/handbook/enums.html#const-enums) in the docs.

They are **removed** in the compilation process and cannot have computed members.

```typescript
const enum Enum {
  A = 1,
  B = A * 2,
}
```

```typescript
const enum Direction {
  Up,
  Down,
  Left,
  Right,
}

let directions = [
  Direction.Up,
  Direction.Down,
  Direction.Left,
  Direction.Right,
];
```

Compiled code:

```javascript
"use strict";
let directions = [
    0 /* Up */,
    1 /* Down */,
    2 /* Left */,
    3 /* Right */,
];
```


## Ambient enums

```typescript
declare enum Enum {
  A = 1,
  B,
  C = 2,
}
```

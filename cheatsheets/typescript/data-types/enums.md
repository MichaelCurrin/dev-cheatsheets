# Enums

See the [Enum](https://www.typescriptlang.org/docs/handbook/enums.html) section in the TS docs. This can get complicated for dynamic lookup. 

In particular see the [const enums](https://www.typescriptlang.org/docs/handbook/enums.html#const-enums) section.

There are 3 types of enum - numeric, string and heterogenous.


## Numeric

```typescript
enum COLOR {
  Red,
  Green,
  Blue = 4
}
```

<details>
<summary>Plain JS equivalent</summary>

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

### Lookup

Lookup by attribute.

```typescript
// a has type COLOR
const a = COLOR.Green;
```

Lookup by string.

```typescript
const b = COLOR['Green'];
```

Lookup by variable. Only works if the enum declaration is **not** done with `const`.

> A const enum member can only be accessed using a string literal.

```typescript
const x = 'Green'
const c = COLOR[x]
```

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


## Get type

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

## Reverse mapping

Reverse mapping - based on a value, get the name of the key. Based on the docs example.

```typescript
enum COLOR {
  Red,
}

const c = Enum.Red;
// 0
const nameOfRed = Enum[c];
// "Red"
```

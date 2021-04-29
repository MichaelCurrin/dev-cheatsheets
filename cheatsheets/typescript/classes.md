# Classes

See also [JavaScript Classes][] cheatsheet.

[JavaScript Classes]: {{ site.baseurl }}{% link cheatsheets/javascript/general/classes.md %}


## Class syntax

Set up `count` as a static variable (shared across class instances).

And `x` and `y` as variables on each class instance.

```typescript
class Point {
  static count = 0
  x: number
  y: number

  constructor(x: number, y: number) {
    this.x = x
    this.y = y
  }
}
```

Or, with shorthand where you can leave the constructor contents empty.

```typescript
class Point {
  static count = 0

  constructor(
    public x: number,
    public y: number,
  ){}
}
```

### Optional fields

As usual with functions, you can make a constructor param optional. e.g. `constructor(public x: number, public y?: number) {}`.

### Fields not set on initialization

Set an attribute that does not get set up in the constructor. Here we don't even have a constructor.

```typescript
class Point {
  public foo!: number;
  // ...
}

const foo = new Point()
x.foo = 123
x.foo
/// 123
```

If you leave out the exclamation mark symbol, you'll get a compile error:

> Property 'foo' has no initializer and is not definitely assigned in the constructor.


## Compiling a class

Based on an example in the TypeScript docs [Classes](https://www.typescriptlang.org/docs/handbook/classes.html) page.

This converts modern class code to the equivalent in old JS before a `class` existed.

### As TypeScript

For ES6 onwards.

```typescript
class Greeter {
  greeting: string;

  constructor(message: string) {
    this.greeting = message;
  }

  greet() {
    return `Hello, ${this.greeting}`;
  }
}

let greeter = new Greeter("world");
```

### As JavaScript

Compiled to plain JS, without class syntax.

```javascript
"use strict";

var Greeter = /** @class */ (function () {
    function Greeter(message) {
        this.greeting = message;
    }
    
    Greeter.prototype.greet = function () {
        return `Hello, ${this.greeting}`;
    };
    
    return Greeter;
}());

var greeter = new Greeter("world");
```

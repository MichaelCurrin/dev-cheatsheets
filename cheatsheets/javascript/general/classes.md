# Classes

## Sample

Based on an example in the TypeScript docs [Classes](https://www.typescriptlang.org/docs/handbook/classes.html) page.

This converts modern class code to the equivalent in old JS before a `class` existed.

### Class syntax

For ES6 onwards.

```typescript
class Greeter {
  greeting: string;

  constructor(message: string) {
    this.greeting = message;
  }

  greet() {
    return "Hello, " + this.greeting;
  }
}

let greeter = new Greeter("world");
```

### Object syntax

For ES5 and older.

```javascript
"use strict";

var Greeter = /** @class */ (function () {
    function Greeter(message) {
        this.greeting = message;
    }
    
    Greeter.prototype.greet = function () {
        return "Hello, " + this.greeting;
    };
    
    return Greeter;
}());

var greeter = new Greeter("world");
```

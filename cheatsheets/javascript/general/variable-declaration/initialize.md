---
title: Initialize
description: Initialization comparison
---

### var keyword

```javascript
var x;
x = 123;

// Or simply
var x = 123;
```

Repeat use of `var` does not cause an error.

```javascript
var x;
var x;
```

### let keyword

```javascript
let y;
y = 123;

let z = 123;
```

Note that `let` can only be used once for a variable.

```javascript
let y;
let y;
// Uncaught SyntaxError: Identifier 'y' has already been declared
```

### const keyword

```javascript
const y = 123;
```

```javascript
const y;
// Uncaught SyntaxError: Missing initializer in const declaration
```

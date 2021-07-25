---
title: Reassign
description: Variable reassignment comparison
---

Reassignment is allowed for `let` and `var`.

```javascript
var x = 123;
x = 10
x = 'a'
```

```javascript
let x = 123;
x = 10
x = 'a'
```

But not for `const` variables.

```javascript
const x = 123
x = 10
// Uncaught TypeError: Assignment to constant variable.
```

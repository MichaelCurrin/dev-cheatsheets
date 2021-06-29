---
title: Dynamic modules
description: |
  Guide to using `import(MODULE`) syntax
---

I am new to this and may not actually need this. This page is incomplete but maybe I'll come back to improve it.


## Example

```sh
$ node --experimental-modules
```

Use a dynamic import.

```javascript
const fs = import('fs')
```

Unforunately, I can't figure out what to do next.

The methods on the object are not so useful.

Using `await` doesn't work in the REPL or as a script because it is not a top-level module.

```
const fs = await import('fs')
           ^^^^^

SyntaxError: await is only valid in async functions and the top level bodies of modules
```


## Why not use the other import

You cannot use `import` `from` syntax in the REPL, even with experimental mode.

```
import fs from 'fs';
^^^^^^

Uncaught:
SyntaxError: Cannot use import statement inside the Node.js REPL, alternatively use dynamic import
```

From `import()` in the [Node docs](https://nodejs.org/api/esm.html#esm_import_expressions).

> Dynamic `import()` is supported in both CommonJS and ES modules. In CommonJS modules it can be used to load ES modules.

Here is the strength - `import` can be used to load ES Module or CommonJS, but within ES Module only.

> An import statement can reference an ES module or a CommonJS module.
> 
> `import` statements are permitted only in ES modules, but dynamic `import()` expressions are supported in CommonJS for loading ES modules.

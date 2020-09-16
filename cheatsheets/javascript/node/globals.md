---
title: Globals
---

## Available

Node.js will inject these for you - you do not need to do explicity import/require.

See a full list in the docs

- https://nodejs.org/api/globals.html

### Global

Almost never use this.

This is for builtins and is like `window`.

```javascript
global
```

Sample from the REPL:

```javascript
> global
```
```javascript
<ref *1> Object [global] {
  global: [Circular *1],
  clearInterval: [Function: clearInterval],
  clearTimeout: [Function: clearTimeout],
  setInterval: [Function: setInterval],
  setTimeout: [Function: setTimeout] {
    [Symbol(nodejs.util.promisify.custom)]: [Function (anonymous)]
  },
  queueMicrotask: [Function: queueMicrotask],
  clearImmediate: [Function: clearImmediate],
  setImmediate: [Function: setImmediate] {
    [Symbol(nodejs.util.promisify.custom)]: [Function (anonymous)]
  }
}
```

### Process

Info on the current running process.

```javascript
process
```

You can view the entire result in the REPL.

Here are some common uses:

```javascript
process.env.Foo
process.exit(1)
```

https://nodejs.org/api/process.html


### Console

As in the browser, you can log in a Node.js app.

```javascript
console.log('Foo')
```

### Require

Find and use modules in the current module.

```javascript
require

require('foo')
```

### Paths

These will give an error in a REPL.

Directory name

```javascript
__dirname
```

Filename

```javascript
__filename
```

### Module

Info about the current module and methods for making is consumable by imports.

```javascript
module
```

Sample from the REPL:

```javascript
> module
```
```javascript
Module {
  id: '<repl>',
  path: '.',
  exports: {},
  parent: undefined,
  filename: null,
  loaded: false,
  children: [],
  paths: [
    '/Users/mcurrin/repl/node_modules',
    '/Users/mcurrin/node_modules',
    '/Users/node_modules',
    '/node_modules',
    '/Users/mcurrin/.node_modules',
    '/Users/mcurrin/.node_libraries',
    '/usr/local/Cellar/node/14.3.0_1/lib/node'
  ]
}
```

### Export

You must use this so that an object is available to import from another script.

```javascript
export
```

Add an export line at the end of your script.
```javascript
function foo () {}

class Bar () {}

// This is more modern and uses a cleaner hash.
export {
  foo,
  Bar
}
// Same as:
module.exports = {
  foo: foo,
  Bar: Bar
}
```

Or export in place:

```javascript
export function foo () {}

export class Bar () {}
```


## Not available

You can't use anything browser-specific in Node.js.

```javascript
window
document
fetch
```

You should avoid using `window` in general anyway as it allows a wider scope (permissions issue) and there maybe collissions. Only if your use an external script like for Google Analytics that needs you to put something on `window`.

You can use a polyfill such as `node-fetch` to allow use of `fetch`.

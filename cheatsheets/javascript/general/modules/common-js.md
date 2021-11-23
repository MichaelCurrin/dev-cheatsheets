---
title: CommonJS
description: |
  Import modules using `require('MODULE');` in Node
---

CommonJS is a way of exporting and import modules.

It only works in Node.js as far as I know. i.e. It does **not** work in the browser or in Deno.

The syntax uses `module.exports` to export and `require` to import a module.

Note this is an old style the newer [ES Modules][] syntax is **preferred** over this style.

[ES Modules]: {% link cheatsheets/javascript/general/modules/es-modules.md %}


## Import installed package

```javascript
const request = require('request');
```


## Local modules

### Named exports

Create a variable, function or class. Then at the end of the script typically you export it.

- `foo.js`
    ```javascript
    function foo() {
      console.log("Hello");
    }

    exports.foo = foo;

    // Or
    module.exports.foo = foo;

    // Shorthand.
    module.exports = {
      foo
    }
    ```

Now import objects by name.

```javascript
const { bar } = require('./foo')
```

For multiple objects.

```javascript
const { bar, bazz } = require('./foo')
```

Or, the less common form:

```javascript
const bar = require('./foo').bar;
```

### Default exports

- `foo.js`
    ```javascript
    function foo() {
      console.log("Hello");
    }

    module.exports = 'foo';
    ```

Import the default object from a module with any name you want.

```javascript
const foo = require('./foo');
```

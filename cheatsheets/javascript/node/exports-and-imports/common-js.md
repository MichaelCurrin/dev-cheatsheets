# CommonJS

The newer ES Modules syntax is preferred over this style.

Use `module.exports` to export and `require` to import a module.


## Import installed package

```javascript
const request = require('request');
```


## Local modules

### Name exports

Create a variable or function or class, then at the end of the script typically you export it.

- `foo.js`
    ```javascript
    function foo() {
    console.log("Hello");
    }

    exports.foo = 'foo';
    // Or
    module.exports.foo = 'foo';
    // Result:
    // { foo: 'foo'}
    ```

Select objects in the module.

```javascript
const { bar } = require('./foo')
// Or, less common.
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

Import the default object from module with any name you want.

```javascript
const foo = require('./foo');
```

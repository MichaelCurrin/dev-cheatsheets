# ES modules

As of ES6 (ES2015), JavaScript `supports` a native module format. It uses the `export` and `import` keywords.


## Import installed package

Depending on the structure of the module.

```javascript
import * as foo from 'foo';
```
Or
```javascript
import { foo } from 'foo';
```


## Local modules

Note you must set this up otherwise you'll get an error.

- `package.json`
    ```json
    {
    "type": "module"
    }
    ```

### Named exports

- `foo.js`
    ```javascript
    function foo() {
      console.log("Hello");
    }

    export { foo };
    ```
- `foo.js` alternative.
    ```javascript
    export function foo() {
      console.log("Hello");
    }
    ```

```javascript
import { foo } from './foo';
```

### Default exports

- `foo.js`
    ```javascript
    function foo() {
      console.log("Hello");
    }

    export default foo;
    ```

```javascript
import foo from './foo';
```

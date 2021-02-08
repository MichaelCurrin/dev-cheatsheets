# ES modules

As of ES6 (ES2015), JavaScript `supports` a native module format.

This approach uses the `export` and `import` keywords.

This approach is widely supported:

- [x] Browser.
- [x] Node.js.
- [x] Deno.


## Configure

Choose ES Module approach.

```html
<script type="module">
import { foo } from './foo';
</script>
```


## Import sources

### Local module

Import from a local module. Note dot slash.

```javascript
import { foo, bar } from './foo';
import { buzz } from '../bazz/bizz';
```

Often the extension is omitted - like `.js`, `.ts` or `.jsx`. You might have to include if `.vue`.

Import types.

```javascript
import { IFoo } from './foo.d';
```

### Import an asset

Copied from [React Quickstart](https://github.com/MichaelCurrin/react-quickstart/tree/master/src).

```javascript
import './index.css';

import Foo from './components/Foo';
import logo from './logo.svg';
```

### Installed package

Import from a packag installed with NPM.

```javascript
import * as vscode from "vscode";
import * as assert from "assert";
import React from 'react';
```

Import from a URL of a package - such as on GH, NPM or a CDN.

```javascript
import React from "https://dev.jspm.io/react";
```

I don't know if this URL approach is used in Node, but it is the main way in Deno and it works well in the browser if using and ES Module.

This avoids having to load React from a CDN in a `script` tag with `src` set to a URL.  Normally a JS script on the server side would have no awareness of that.

If using Deno, this means can run your JS code consistently on the server side and in the browser.


## Local modules

In an NPM project, you can configure your project to use ES Modules as follows.

- `package.json`
    ```json
    {
      "type": "module"
    }
    ```

In testing, I found that my ES Module imports gave an error without this config value setup.

A hybrid approach is possible as in [Vue Quickstart](https://github.com/MichaelCurrin/vue-quickstart), when **omitting** the config value above. The configs at the top-level using `module.exports` syntax but the `src` directory modules use the ES Module syntax.

### Named exports

Some ways to export with a name.

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

// Multiple.
import { foo, fuzz } from './foo';

// Rename.
import { foo as fizz } from './foo';
```

Or, exporting a module (without importing it first).

- `foo.js`
    ```javascript
    export { foo } from './foo';
    ```

Import multiple objects and put them under a namespace.

```javascript
import * as foo from "./foo";
foo.bar()
foo.buzz()
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

### Combine multiple defaults

Normally:

```javascript
export React from "https://dev.jspm.io/react";
// And.
export ReactDOMServer from "https://dev.jspm.io/react-dom/server";
```

Combined:

```javascript
export { default as React } from "https://dev.jspm.io/react";
export { default as ReactDOMServer } from "https://dev.jspm.io/react-dom/server";
```

Now you can import from that module.

```javascript
import { React, ReactDOMServer } from "./deps.ts";
```

### Mixing named and default imports

Intended:

```javascript
// Default.
import React from "./deps.ts"
// Named.
import { Application } from "./deps.ts";
```

Combined:

```javascript
import React, { Application } from "./deps.ts";
```

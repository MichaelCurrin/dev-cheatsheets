# ES modules

As of ES6 (ES2015), JavaScript supports a native module format.

This approach uses the `export` and `import` keywords, instead of `require`.

## Support

This approach is widely supported:

- [x] Browsers (including Chrome, Firefox and Safari since at least 2018).
- [x] Node.js
- [x] Deno

For browsers which don't support it, you can use a fallback:

```javascript
<script type="module" src="main.js"></script>
<script nomodule src="fallback.js"></script>
```


## Resources

- [ES modules: A cartoon deep-dive](https://hacks.mozilla.org/2018/03/es-modules-a-cartoon-deep-dive/) blog post.
- [Introduction to ES Modules](https://flaviocopes.com/es-modules/) blog post.
- [ECMAScript Modules](https://nodejs.org/api/esm.html) in the Node.js docs.
- [Import and export examples](https://deno.land/manual/examples/import_export) in the Deno docs.


## Configure

Set the type of script tag to `module`. 

This works for an inline script or linking using `src`. 

Keep in mind for the sections later on this page that you can use either approach. Having your JS in a file or files separate from HTML can make JS easier to manage.

### Inline approach

- `index.html`
    ```html
    <script type="module">
    import { bar } from "https://dev.jspm.io/some-library";

    import { foo } from "./foo";
    </script>
    ```

### External approach

- `index.html`
    ```html
    <script type="module" src="main.js"></script>
    ```
- `main.js`
    ```javascript
    import { bar } from "https://dev.jspm.io/some-library";
    
    import { foo } from './foo';
    ```

### Scoping note

Note that imports are **scoped** to where they are used. So after script runs, you cannot access it in the dev console. But the plus side is that you can don't have to worry about namespace collisions of different packages. And you can even import two versions of say React on the same page and use them independently in two `script` tags.


## Import sources

Reminder that these work either with 

### Import local JS module

Import from a local module. Note dot slash.

```javascript
import { foo, bar } from './foo';
import { buzz } from '../bazz/bizz';
```

Often the extension is omitted - like `.js`, `.ts` or `.jsx`. You might have to include if `.vue`.

### Import type definitions

For use in TypeScript.

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

### Import a 3rd-party package

#### From Node modules

Import from a package installed with NPM.

```javascript
import * as vscode from "vscode";
import * as assert from "assert";
import React from 'react';
```

Or if you've aliased a package name to a URL with import maps or a `deps.ts` file (Deno).

#### From a URL

Import from a URL of a package - such as on GH, NPM or a CDN.

```javascript
import React from "https://dev.jspm.io/react";
```

The browser will download that script for you. No NPM needed.

This means can run your JS code consistently on the server-side and in the browser. At least with Deno. I don't know about Node.

Normally a JS script on the server side would have no awareness of the HTML tag to load JS using `script` tag with `src`.

Pl

This is also the default approach Deno.


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

Usage:

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

Usage:

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


## Nomodule

In case a browser does not support ES Modules, you can prompt the user to upgrade.

Example - based on [esm.sh](https://esm.sh/) homepage source.

```html
<script module>
    // ...
</script>
<script nomodule>
    const mainEl = document.querySelector('main');
    mainEl.innerHTML = '<p><em style="color: #999;">nomodule, please upgrade your browser...</em></p>'
</script>
```

---
title: ES Modules
description: |
  Import modules using `import IMPORTS from "MODULE"` - in Node, Deno or the browser.
---

As of ES6 (ES2015), JavaScript supports a native module format called ES Modules, or ECMAScript Modules. This is modern way to do modules in JavaScript.

This approach uses the `export` and `import` keywords, instead of the older CommonJS syntax of `module.exports` and `require`.

This page covers more details on the syntax and examples of loading modules in different situations.


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

- [ECMAScript Modules](https://nodejs.org/api/esm.html) in the Node.js docs.
- [Import and export examples](https://deno.land/manual/examples/import_export) in the Deno docs.
- [Introduction to ES Modules](https://flaviocopes.com/es-modules/) blog post by Flavio Copes.
- [ES modules: A cartoon deep-dive](https://hacks.mozilla.org/2018/03/es-modules-a-cartoon-deep-dive/) blog post.


## Enable ESModules

### Set script tag type

Set the type of script tag to `module`. 

This works for an inline script or linking using `src`. 

Keep in mind for the sections later on this page that you can use either approach. Having your JS in a file or files separate from HTML can make JS easier to manage.

#### Inline approach

- `index.html`
    ```html
    <script type="module">
    import { bar } from "https://dev.jspm.io/some-library";

    import { foo } from "./foo";
    </script>
    ```

#### External approach

- `index.html`
    ```html
    <script type="module" src="main.js"></script>
    ```
- `main.js`
    ```javascript
    import { bar } from "https://dev.jspm.io/some-library";
    
    import { foo } from './foo';
    ```

### Set package type

Configure NPM to see your project as ES Modules.

- `package.json`
    ```json
    {
      "name": "my-app",
      "type": "module"
    }
    ```
    
Warning - if you have a config or ESLint or similar which uses the old `module.exports` syntax, you'll get an error and so you'll have to rewrite that config. VS Code provides a neat feature to do that for you.

### Set file extension

Use `.mjs` extension in place of `.js`. This is not so common, but it allows you do mix both types in a project which does not have the NPM config set to use the module type.

### External

When loading a JS library from a CDN, make sure you pick a URL which is compatible with ES Modules approach. This might mean a param like `?module` or loook for `.mjs` extension.

See my [JS CDNs](https://michaelcurrin.github.io/dev-resources/resources/javascript/cdns.html) guide.


## Scoping note

Note that imports are **scoped** to where they are used. So after script runs, you cannot access it in the dev console. But the plus side is that you can don't have to worry about namespace collisions of different packages. And you can even import two versions of say React on the same page and use them independently in two `script` tags.


## Import sources

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

#### Styling

Load a CSS file so that it gets added to the page. Note you don't have to specify an object to import or how it will be used on the page.

```javacript
import './index.css';
```

#### Images

Load a image as an object so you can use it as a URL in your content.

Based on [React Quickstart](https://github.com/MichaelCurrin/react-quickstart/blob/main/src/App.jsx).

```javascript
import logo from './logo.svg';

export default function App() {
  return (
    <div className="App">
      <img src={logo} />
    </div>
  );
}
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

This is also the default approach for Deno.


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

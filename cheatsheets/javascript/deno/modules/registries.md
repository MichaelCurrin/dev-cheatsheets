---
title: Registries
description: How import Deno packages from various registries
---

Note the GH and NPM imports might still be experimenal features.


## Deno standard library

- [deno.land/std](https://deno.land/std) on Deno homepage.
- [denoland/deno_std](https://github.com/denoland/deno_std) repo of packages.

```typescript
import * as log from "https://deno.land/std@0.86.0/log/mod.ts";
import { serve } from "https://deno.land/std@0.86.0/http/server.ts";
```


## Deno x

Deno has its own registry of 3rd-party packages.

- [deno.land/x](https://deno.land/x)
    > deno.land/x is a hosting service for Deno scripts. It caches releases of open source modules stored on GitHub and serves them at one easy to remember domain.

The URL format is:

- Latest version: `https://deno.land/x/IDENTIFIER/FILE_PATH`
- Locked version: `https://deno.land/x/IDENTIFIER@VERSION/FILE_PATH`


### Native

Example:

```typescript
import { Application } from "https://deno.land/x/oak/mod.ts";
```

### GitHub

Example:

```typescript
import { amqp } from "https://deno.land/x/gh:lenkan:amqp/mod.ts";
import { amqp } from "https://deno.land/x/gh:lenkan:amqp@v0.9.1/mod.ts";
```

### NPM

Example:

```typescript
import { numbers } from "https://deno.land/x/npm:numbers/index.js";
import { numbers } from "https://deno.land/x/npm:numbers@v0.7.0/index.js";
````


## CDNs

If you want to install an NPM package in a Deno project, you can do that using one of many CDNs.

They might not store anything themselves directly but might just point to NPM.

The CDN will give you a choice of optmized builds and multiple files to choose from. Such as minified or not. And CommonJS or ESModule.

You can reference the CDN URL in your Deno TS code or directly in your browser as an ES Module. These CDN URLs are reusuable - they also provide instructions on how to use in Deno, the browser, etc. Sometimes you need a URL flag to indicate that that you need a Deno-specific module.

The CDN URLs scripts I've seen so far tend to be just a few lines long and reference multiple packages on NPM. This means that even if a package is not in the Deno package registry, you can still easily use it in your Deno project. And this means you can use Deno to build say a React application using a CDN for dependencies and then you can bundle your app as a single JS file that can be loaded on the browser.

Here are some CDNs I've come across and how to use them for Deno projects so you can get packages that are on NPM.

See also [CDNs](https://michaelcurrin.github.io/dev-resources/resources/javascript/cdns.html) in my Dev Resources guide.

### JSPM

- [JSPM](https://jspm.org/)

> jspm provides a module CDN allowing any package from npm to be directly loaded in the browser and other JS environments as a fully optimized native JavaScript module.

Everything is already an ESModule and works well in Deno - no query params needed.

Example:

```javascript
import React from "https://dev.jspm.io/react";
```

If you go to that URL, you'll see a few lines of JS content. Which is suitable for Deno or running on an HTML page (see the instructions on the JSPM site).

- [dev.jspm.io/react](https://dev.jspm.io/react)

When I visited that URL, the content of that requested file was:

```javascript
import { dew } from "/npm:react@17.0.1/index.dew.js";
export default dew();
import "/npm:react@17.0.1/cjs/react.development.dew.js";
import "/npm:object-assign@4?dew";
```

If you add a forward slash, you can see files in that directory. 

- [dev.jspm.io/react](https://dev.jspm.io/react/)

For example, for ReactDOM at [dev.jspm.io/react-dom/](https://dev.jspm.io/react-dom/) has `server.js` so you can load that [dev.jspm.io/react-dom/server](https://dev.jspm.io/react-dom/server). The `index.js` file is available as `/react-dom` or `/react-dom/index`.

So you can use any NPM registry package in Deno if it supported on JSPM. Without using the `npm` command. Also, this more secure, as when Deno installs the package is only uses the access you give it. While an NPM package with a post-install script command might be doing something system wide that is insecure or even malicious and the permissions are not restricted.

In Node, you can install `jspm` as an NPM package - [Getting Started](https://jspm.org/docs/0.16/getting-started.html)

Then you can do ES Module imports like this, as in the browser or Deno.

```javascript
import _ from 'lodash-node/modern/lang/isEqual.js';
```

### Skypack

- [skypack.dev](https://www.skypack.dev/)

> Skypack is the world’s first CDN designed and optimized for modern JavaScript applications. To use it, just use a Skypack URL whenever you want to load a package:

```javascript
import React from 'https://cdn.skypack.dev/react';
```

Specifically for Deno, use `?dts` in the URL.

e.g.

```typescript
import confetti from "https://cdn.skypack.dev/confetti?dts"
```

URL formats, from the homepage:

- Default: `https://cdn.skypack.dev/package-name`
- Version: `https://cdn.skypack.dev/preact@10`
- Min: `https://cdn.skypack.dev/preact?min`
- Deno: `https://cdn.skypack.dev/fast-xml-parser?dts`

React:

- Default: `https://cdn.skypack.dev/react`
- Deno: `https://cdn.skypack.dev/react?dts`

### ESM

- [esm.sh](https://esm.sh/)
    > A fast, global content delivery network for ES Modules. All modules are transformed to ESM by esbuild in NPM.

You don't need an extra flag for use with Deno. The default will work.

Format:

- Default: `https://esm.sh/package`
- Version: `https://esm.sh/package@version`

React:

```typescript
import React from 'https://esm.sh/react'
```

Content from following that React URL:

```javascript
/* esm.sh - react@17.0.1 */
export * from "https://cdn.esm.sh/v15/react@17.0.1/esnext/react.js";
export { default } from "https://cdn.esm.sh/v15/react@17.0.1/esnext/react.js";
```

Sample from the _Deno Compatibility_ section of the homepage:

> esm.sh will polyfill the `node` internal modules (`fs`, `os` , etc.) with `https://deno.land/std/node` to support some modules to work in Deno, like `postcss`:

```typescript
import postcss from 'https://esm.sh/postcss'
import autoprefixer from 'https://esm.sh/autoprefixer'

const css = (await postcss([ autoprefixer]).process(`
    backdrop-filter: blur(5px);
    user-select: none;
`).async()).content
```

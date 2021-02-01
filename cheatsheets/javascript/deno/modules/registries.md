---
title: Registries
description: How import Deno packages from various registries


Note the GH and NPM imports might still be experimenal features.

## From Deno x

Deno has its own packages registry.

- [deno.land/x](https://deno.land/x)

```typescript
import { Application } from "https://deno.land/x/oak/mod.ts";
```


## From GitHub

```typescript
import { amqp } from "https://deno.land/x/gh:lenkan:amqp/mod.ts";
import { amqp } from "https://deno.land/x/gh:lenkan:amqp@v0.9.1/mod.ts";
```


## From NPM

```typescript
import { numbers } from "https://deno.land/x/npm:numbers/index.js";
import { numbers } from "https://deno.land/x/npm:numbers@v0.7.0/index.js";
````


## CDNs

You can use a CDN which provides a few lines to import from say NPM. This uses the new Moduled syntax, which is reusable across applications and even on the frontend.

Sometimes you need a URL flag to indicate that that you need a Deno-specific module.

### JSPM

You can load a script from [JSPM](https://jspm.org/), which provides a few lines so you can import the packages you need from say NPM.

> jspm provides a module CDN allowing any package from npm to be directly loaded
in the browser and other JS environments as a fully optimized native JavaScript module.

e.g. I learnt this in a tutorial on Deno.

```javascript
import React from "https://dev.jspm.io/react";
```

If you go to that URL [dev.jspm.io/react](https://dev.jspm.io/react), you'll see a few lines of JS content. Which is suitable for Deno or running on an HTML page (see the instructions on the JSPM site).

When I visited that URL, the content of that requested file was:

```javascript
import { dew } from "/npm:react@17.0.1/index.dew.js";
export default dew();
import "/npm:react@17.0.1/cjs/react.development.dew.js";
import "/npm:object-assign@4?dew";
```

So you can use any NPM registry package in Deno if it supported on JSPM. Without using the `npm` command. Also, this more secure, as when Deno installs the package is only uses the access you give it. While an NPM package with a post-install script command might be doing something system wide that is insecure or even malicious and the permissions are not restricted.

### Skypack

An alternative to JSPM.

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

---
title: Import maps
description: How to make your imports easier to manage
---

{% raw %}

Import maps allows control over what URLs get fetched by JavaScript `import` statements and `import()` expressions.


## Compatibility

Warning - the `importmaps` specification is not widely used yet.

See [Can I Use](https://caniuse.com/?search=importmap). Currently Firefox has no support. There is a [Feature request](https://bugzilla.mozilla.org/show_bug.cgi?id=1688879) open though.

> This is probably the most anticipated feature in JavaScript history. It will, finally, after 25 years, enable the bundler-free web development. Please prioritize it, thank you!

See [Polyfill](#polyfill) section below for adding support with a polyfill.


## How to set it up

Define a script with type set to `importmap`, including mapping of short names to long URLs. Then, after that you can do imports from the short names.

This will keep your code light.

This also makes it easier to control your versions - you can use `"react"` as an import all over the place but you only have to define `react@17.0.1` in one place.

Another approach would be have a central dependencies script which is not an import map, and have that export everything which you need and import later. But there could be collisions between names.


## Syntax

```html
<script type="importmap">
{
  "imports": {
    "PACKAGE": "https://jspm.dev/PACKAGE@VERSION",
    "@ORG/PACKAGE": "https://jspm.dev/@ORG/jPACKAGE@VERSION",
  }
}
</script>
```


## Examples

Here from the JSPM [sandbox](https://jspm.org/sandbox) page.

### Vue

- `index.html`
    ```html
    <!DOCTYPE html>
    
    <body style=margin:0>
      <div id="container"></div>
    </body>
    
    <script type="importmap">
    {
      "imports": {
        "vue": "https://jspm.dev/vue/dist/vue"
      }
    }
    </script>
    
    <script type="module">
    import Vue from 'vue';

    container.innerHTML = `<p>{{ message }}</p>`;

    new Vue({
      el: '#container',
      data: {
        message: 'Hello Vue.js!'
      }
    });
    </script>
    ```

### Babel

- `index.html`
    ```html
    <!doctype html>

    <body style="margin:0">
    </body>

    <script type="importmap">
    {
      "imports": {
        "@babel/core": "https://jspm.dev/@babel/core@7",
        "@babel/plugin-proposal-class-properties": "https://jspm.dev/@babel/plugin-proposal-class-properties@7"
      }
    }
    </script>

    <script type="module">
    import babel from '@babel/core';
    import babelPluginProposalClassProperties from '@babel/plugin-proposal-class-properties';

    const { code } = babel.transform(`
      class P {
        classProperty = 'value'
      }
    `, {
      plugins: [babelPluginProposalClassProperties]
    });

    document.body.innerHTML = `<pre>${code}</pre>`;
    </script>
    ```
    
### PrimeVue

This is my own example, from setting up Vue and PrimeVue to work without Node.

I was loading a Button component as:

```javascript
import Button from "https://unpkg.com/primevue@3.4.0/button/button.esm.js"
```

But I got errors in loading the script saying that `primevue/ripple` was not defined. And that script in turn uses `primevue/utils`.

I added these all to my import map as follows:

```html
<script type="importmap">
    {
      "imports": {
        "vue": "https://unpkg.com/vue@3.0.7/dist/vue.esm-browser.js",
        "primevue/utils": "https://unpkg.com/primevue@3.4.0/utils/utils.esm.js",
        "primevue/ripple": "https://unpkg.com/primevue@3.4.0/ripple/ripple.esm.js",
        "primevue/button": "https://unpkg.com/primevue@3.4.0/button/button.esm.js"
      }
    }
</script>
```
    
And I rewrote my import as:

```javascript
import Button from "primevue/button";
```

Then that allowed those imports to work.

Only in Chrome though. Firefox is not supported.

I tried without the import maps syntax to load in transitive dependencies. I was strict with keeping this order. Unfortunately, `ripple` still gets an error on not finding `primevue/utils`.

```javascript
import "https://unpkg.com/primevue@3.4.0/utils/utils.esm.js";
import "https://unpkg.com/primevue@3.4.0/ripple/ripple.esm.js";
import Button from "https://unpkg.com/primevue@3.4.0/button/button.esm.js";
```


## Importing a directory or not

Here are two examples below, using PrimeVue and import maps.

### Load directory of modules

Here I set a forwardslash to allow imports from the directory. I have to set version `3.4.0` once.

```json
{
    "importmap": {
        "primevue/": "https://unpkg.com/primevue@3.4.0/"
    }
}
```

Then that put the burden on the scripts to load specific files.

```javascript
import Button from "primevue/button/button.esm.js";
import Timeline from "primevue/timeline/timeline.esm.js";
```

### Load module in a directory

Here I specify each module inside `primevue`. There's a burden to keep the values all at the same version, but at least it is centralized by using an import map.

```json
{
    "importmap": {
       "primevue/button": "https://unpkg.com/primevue@3.4.0/button/button.esm.js",
       "primevue/timeline": "https://unpkg.com/primevue@3.4.0/timeline/timeline.esm.js"
    }
}
```

Then JS imports are light.

```javascript
import Button from "primevue/button";
import Timeline from "primevue/timeline";
```

## Polyfill

You can bring Import Map support to more browsers by using a polyfill, which adds functionality.

Here I am using "ES Module Shims".

From the docs:

> 93% of users are now running browsers with baseline support for ES modules.
> 
> But modules features like Import Maps will take a while to be supported in browsers.
> 
> It turns out that we can actually polyfill new modules features on top of these baseline implementations in a performant 7KB shim.

So a small file size seems great.

Check out the repo and docs.

[![guybedford - es-module-shims](https://img.shields.io/static/v1?label=guybedford&message=es-module-shims&color=blue&logo=github)](https://github.com/guybedford/es-module-shims)

That provided me with this snippet, giving me a choice of a polyfill from either CDN.

```html
<!-- UNPKG -->
<script src="https://unpkg.com/es-module-shims@0.10.1/dist/es-module-shims.js"></script>

<!-- JSPM.IO -->
<script async src="https://ga.jspm.io/npm:es-module-shims@0.10.1/dist/es-module-shims.js"></script>
```

I added the UNPKG one to my site, which now works well on Firefox.

Here is a snippet from the first time I saw it in use, on JSPM Generator playground:

```html
<!-- ES Module Shims: Import maps polyfill for modules browsers without import maps support (all except Chrome 89+) -->
<script src="https://ga.jspm.io/npm:es-module-shims@0.10.1/dist/es-module-shims.min.js"></script>
```

### Async and defer

I took out `async` though from the examples above. As that is not reliable though. As the script might be loaded _after_ it is needed. The impact is so small, so it is fine to use no `async`. 

You can also use `defer` instead. Then you can have the polyfill deferred and your main JS script deferred, so they will be non-blocking (making them easy to put in the `head`, yet will still load in the correct order.

{% endraw %}

---
title: Import maps
description: How to make your imports easier to manage
---

{% raw %}

Import maps allows control over what URLs get fetched by JavaScript `import` statements and `import()` expressions.


## Warning

The `importmaps` specification is not widely used yet.

See [Can I Use](https://caniuse.com/?search=importmap).


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

{% endraw %}

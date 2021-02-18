---
title: Import maps
description: How to make your imports easier to manage
---

{% raw %}

Define a script with type set to `importmap`, including mapping of short names to long URLs. 

Then, after that you can do imports from the short names.

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
    
{% endraw %}

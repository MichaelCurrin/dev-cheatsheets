---
title: Import maps
description: How to make your imports easier to manage
---

{% raw %}


## Syntax

<script type="importmap">
{
  "imports": {
    "PACKAGE": "https://jspm.dev/PACKAGE@VERSION",
    "@ORG/PACKAGE": "https://jspm.dev/@ORG/jPACKAGE@VERSION",
  }
}
</script>


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

# Mounting

{% raw %}

## Vue 2 Warning

When Vue mounts a target element, it actually _replaces_ it. So therefore if you use `app` as the ID of your `div` element, you must duplicate it in both in your `index.html` and `App.vue` files.

If instead of using `'#app'` as your mount point, you selected `document.body`, then your `body` element of the DOM will be removed and replaced by your app div. This is a bad idea. Though I have seen targeting `body` in other non-Vue apps.

This applies to using Vue in a Node app only and only Vue 2. 

For adding Vue to your frontend without Node, as in [vue-frontend-quickstart](https://michaelcurrin.github.io/vue-frontend-quickstart/), you can leave out the app div from your top-level component's template tag.


## HTML mount point

Add a `div` element with `app` ID as your mount point. Leave this `div` element empty. When Vue loads, it will insert elements there.

Note that leaving `div` empty can leave your app looking empty to SEO crawlers, so you might to put some content there. Human users might see the content but it will get overwritten within a second as your app mounts.

- `index.html
    ```javascript
    <body>
        <noscript>
            <strong>We're sorry but <%= htmlWebpackPlugin.options.title %> doesn't work properly without
                JavaScript enabled.
                Please enable it to continue.</strong>
        </noscript>

        <div id="app">
        </div>
    </body>
    ```

Between Vue and Webpack, you'll get CSS added so you don't have to add it yourself to `head` - at least for a Node app. For a frontend app you must add to `head` yourself. To keep this example short, there is no `head` above.


## Component template tag

- `App.vue`
    ```vue
    <template>
      <div id="app">
        <h1>Hello, {{ world }}</h1>
      </div>
    </template>
    ```


## JavaScript main script

### Vue 3

See [Mounting App Instance](https://v3.vuejs.org/guide/migration/global-api.html#mounting-app-instance) Vue 3 docs.

Point Vue as your `div` setup above.

- `main.js`
    ```javascript
    import { createApp } from 'vue'
    import App from './App.vue'

    const app = createApp(App)
    app.mount('#app')
    ```

### Vue 2

See [Vue Instance](https://vuejs.org/v2/guide/instance.html) Vue 2 docs.

- `main.js`
    ```javascript
    import Vue from "vue";
    import App from "./App.vue";

    new Vue({
      render: (h) => h(App),
    }).$mount('#app');
    ```

{% endraw %}

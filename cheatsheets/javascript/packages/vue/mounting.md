# Mounting


## Warning

When Vue mounts a target element, it actually _replaces_ it. So therefore if you use `app` as the ID of your `div` element, you must duplicate it in both in your `index.html` and `App.vue` files.

If instead of using `'#app'` as your mount point, you selected `document.body`, then your `body` element of the DOM will be removed and replaced by your app div. This is a bad idea. Though I have seen targeting `body` in other non-Vue apps.

This applies to using Vue in a Node app only. For adding Vue to your frontend without Node, as in [vue-frontend-quickstart](https://michaelcurrin.github.io/vue-frontend-quickstart/), you can leave out the app div from your top-level component's template tag.


## HTML

```javascript
<body>
    <noscript>
        Your message here
    </noscript>

    <div id="app"></div>
</body>
```

## Template

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

- `main.js`
    ```javascript
    import { createApp } from 'vue'
    import MyApp from './MyApp.vue'

    const app = createApp(MyApp)
    app.mount('#app')
    </script>
    ```

### Vue 2

See [Vue Instance](https://vuejs.org/v2/guide/instance.html) Vue 2 docs.

- `main.js`
    ```
    import Vue from "vue";
    import App from "./App.vue";

    new Vue({
        render: (h) => h(App),
    }).$mount('#app');
    ```

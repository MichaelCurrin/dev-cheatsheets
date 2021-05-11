# Style


## Global styles

- `App.vue`
    ```vue
    <template>
    </template>

    <script>
    </script>

    <style>
    #app {
      font-family: Avenir, Helvetica, Arial, sans-serif;
    }
    </style>
    ```


## Scoped styles

Limit styling to just a component - use the `scope` flag in the `style` tag.

- `components/HelloWorld.vue`
    ```vue
    <template>
    </template>

    <script>
    </script>

    <style scoped>
    h3 {
      margin: 40px 0 0;
    }
    </style>
    ```


## Inline styles

Pass JS attributes as your styling. Note use of colon in `:style` and passing a JS object which uses `margineLeft` and not `margin-left` like in normal CSS.

```html
<span :style="{ marginLeft: '.5em' }">{{ value2 }}</span>
```


## Set class

Reference a class in the `style` section.

```html
<div :class="$style.CLASS_NAME"></div>
```

e.g. From the Neutrino quickstart:

- `App.vue`
    ```vue
    <script>
    export default {
      name: "App",
      data() {
        return {};
      },
    };
    </script>

    <template>
      <div :class="$style.App">
        <h1>Welcome to neutrino-vue-quickstart</h1>
      </div>
    </template>

    <style module>
    .App {
      padding: 20px;
    }
    </style>
    ```
    

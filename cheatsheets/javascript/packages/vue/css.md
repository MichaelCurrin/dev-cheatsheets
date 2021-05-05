# CSS


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

Pass JS attributes as your styling. Note use of colon in `:style="{}"`.

```html
<span :style="{ marginLeft: '.5em' }">{{ value2 }}</span>
```

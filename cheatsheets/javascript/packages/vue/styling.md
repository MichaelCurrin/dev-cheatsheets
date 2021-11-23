# Styling

See [vue-quickstart](https://github.com/MichaelCurrin/vue-quickstart) repo as an example. It uses the Vue CLI quickstart app. The `App.vue` file uses a global style and the `HelloWorld.vue` component uses a scoped style.


## CSS Modules

- [CSS Modules](https://vue-loader.vuejs.org/guide/css-modules.html) in Vue Loader docs.


## Global styles

Set a plain `style` tag.

```html
<style>
</style>
```

The CSS will be accessible across your components. This is useful in the top-level `App.vue` component, as you might set styling for `p` and `h1` tags for example and you want that to be applied on lower-level components too.

Demonstration using both ID and class styles.

- `App.vue`
    ```vue
    <template>
      <div id="#app" class=".App">
        <h1>Hello world</h1>
      </div>
    </template>

    <script>
    export default {
      name: 'App',
      data() {
        return {};
      },
    };
    </script>

    <style>
    #app {
      font-family: Avenir, Helvetica, Arial, sans-serif;
    }

    .App {
      padding: 20px;
    }
    </style>
    ```

DOM Result:

```html
<div id="#app" class=".App">
    <h1>Hello world</h1>
</div>
```


## Scoped styles

Limit styling to just a component - use the `scope` flag in the `style` tag.

```html
<style scoped>
</style>
```

e.g.

- `components/HelloWorld.vue`
    ```vue
    <template>
      <div id="#app" class=".App">
        <h1>Hello world</h1>
      </div>
    </template>

    <script>
    export default {
      name: 'App',
      data() {
        return {};
      },
    };
    </script>

    <style scoped>
    h3 {
      margin: 40px 0 0;
    }
    </style>
    ```

That adds Vue data attributes.

e.g.

```html
<div data-v-7ba5bd90="" class=".App">
    <h1 data-v-7ba5bd90="">
        Hello world
    </h1>
</div>
```


## Inline styles

Pass JS attributes as your styling.

Note use of colon in `:style` and passing a JS object which uses `margineLeft` and not `margin-left` like in normal CSS.

```html
<span :style="{ marginLeft: '.5em' }">{{ value2 }}</span>
```

See also [Binding][] cheatsheet.

[Binding]: {% link cheatsheets/javascript/packages/vue/components/binding.md %}


## Module styles

This is maybe a newer or lesser known approach, as I've only come across it once.

Reference a class in the `style` section and set type as `module.

```vue
<template>
    <div :class="$style.CLASS_NAME"></div>
</template>

<style module>
</style>
```

e.g. From the Neutrino quickstart:

- `App.vue`
    ```vue
    <template>
      <div :class="$style.App">
        <h1>Hello world</h1>
      </div>
    </template>

    <script>
    export default {
      name: "App",
      data() {
        return {};
      },
    };
    </script>

    <style module>
    .App {
      padding: 20px;
    }
    </style>
    ```


You'll get a predictable hashed value for your class.

Such as this in the DOM:

```html
<div class="bFWuavTErZyRKog1ySVQA">
    <h1>Hello world</h1>
</div>
```

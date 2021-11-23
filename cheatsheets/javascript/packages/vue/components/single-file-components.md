---
title: Single-file components
description: How to a structure and write a component in `.vue` file
---

A Single-File Component is also known as a "SFC".

See also [Component registration][] section.

[Component registration]: {% link cheatsheets/javascript/packages/vue/components/component-registration.md %}


{% raw %}


## Documentation

- Vue 3 - [Single-file components](https://v3.vuejs.org/guide/single-file-component.html)
- Vue 2 - [Single-file components](https://vuejs.org/v2/guide/single-file-components.html)

See [Pre-compiling templates](https://v3.vuejs.org/guide/tooling/deployment.html#pre-compiling-templates) in the Vue 3 Production Deployment guide. That gives you a choice of SFCs as linked above, or `vue-template-loader` for Webpack. See also my [No build step](https://michaelcurrin.github.io/code-cookbook/recipes/javascript/packages/vue/no-build-step.html) recipe.


## Outline

The skeleton structure.

- `Foo.vue`
    ```vue
    <template>
    </template>

    <script>
    </script>

    <style>
    </style>
    ```

Note that `template` cannot actually be blank as you'll get an error.


## Template section

```html
<template>
    <span>{{ message }}</span>
</template>
```


## Script section

### Overview

As defined on the Vuex site, a component has 3 aspects:

- Model - data names and types understood by the component.
- View - present content to the user as HTML. Vue is named from the French word for "view".
- Actions - where logic gets done, passing data to and from the view.

This is similar to the classic "Model View Controller" programming approach - which actually originally was used for components and not intended to describe the entire structure of an app, so it makes sense to use it at the Vue component level.

Vue uses methods on a component in the script section which map to the above.

- Model
    - `data` function of attributes, for managing state. Previously an attribute but deprecation warnings say it must be a function now.
    - `props` attribute for accepting parameters.
- View
    - `template` attribute. Or set `<template>` tag. Both give the same result.
- Actions
    - `methods` attribute of functions. Handle user input and get or set values in the state such as on `data`.
    - `computed` attribute of functions. Similar to methods, but, this is used for _getting_ values only, values are **cached**, you can't pass parameters, and you access computed values like a variable i.e. without using brackets like for a method call.

For info on `template` attribute and `render` method, see [DOM](https://v3.vuejs.org/api/options-dom.html) in the docs.

### Data and methods

Most components will just need data and methods.

Here we have a view such as `About.vue`, which calculates and renders results. It might use further components in its template section.

- `About.vue`
    ```vue
    <script>
    export default {
      name: "Foo",

      // A function returning a dictionary.
      data() {
        return {
          foo: "Foo",
          bar: "",
      },

      // An attribute returning a dictionary of functions.
      methods: {
        submit() {
          this.bar = this.foo.toUpperCase();
        }
      }
    }
    </script>
    ```

Note on modern JS:

- Short
    ```javascript
    {
        methodName() {}
    }
    ```
- Long
    ```javascript
    {
        methodName function() {}
    }
    ```

### Props and computed

Here we have a script for a component that accepts props and has some computed values.

- `myComponent.vue`
    ```vue
    <script>
    import Buzz from "@/components/Buzz.vue";

    export default {
      name: "Foo",

      components: {
        Buzz,
      },

      // An attribute returning a dictionary where each value is a dictionary.
      props: {
        foo: { type: String, required: true },
      },

      // An attribute returning a dictionary of functions.
      computed: {
        newFoo() {
          return this.foo.toUppercase();
        },
        buzz() {
          return 'Buzz';
        }
      }
    };
    </script>
    ```

Use it as:

```html
<MyComponent :foo="myExpression"></MyComponent>
```

Notes on props:

- Optional
    ```
    foo: String
    ```
- Required
    ```
    foo: { type: String, required: true }
    ```

Note on computed section:

- The `computed` values are cached, for efficiency. This computed variable will appear to change immediately based on user input, but in some cases it won't (I had issues before using a computed variable as a `slot` which was frozen, but passing it as a binding parameter was fine).
- Computed variables can be reference in a script tag or template tag but without brackets and without arguments i.e. without brackets. They are useful if you have a value to generate based on other use choices.
- Methods need brackets to be called and are more interactive behavior or events.

#### TypeScript note

In TypeScript, it is as good idea to add the return type for a computed variable explicitly. This was advised by the docs, to avoid weird behavior. I also found that if I did _not_ include the type, then the attributes on `this` would cause an error in TypeScript compilation.

```typescript
{
  computed: {
    myVar(): number {
      return this.myNumber ** 2;
    },
  }
}
```

### Template on JS object

If you prefer, you can leave out the `template` tag and specify that content in the `script` tag as follows.

```javascript
export default {
  name: "MyFoo",
  props: {
      message: { type: String, required: true },
  },
  template: `
      <span>{{ message }}</span>
  `
};
```

This can be useful if you have Vue on the frontend without a build step, as this the template variable does not need a compilation step.


## Style section

Note that you'll get an error adding `style` in your template section.

Add a separate `style` section in your `.vue` file.

Scope you CSS styles to the current template only using `scoped`.

```vue
<style scoped>
</style>
```

{% endraw %}

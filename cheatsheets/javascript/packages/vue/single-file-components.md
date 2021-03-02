---
title: Single-file components
description: How to a structure and write a `.vue` file
---

{% raw %}

Docs:

- Vue 3 - [Single-file components](https://v3.vuejs.org/guide/single-file-component.html)
- Vue 2 - [Single-file components](https://vuejs.org/v2/guide/single-file-components.html)


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

Here we have a script for a component that accepts props.

- `myComponent.vue`
    ```javascript
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

Note on computed section:

- The `computed` values are cached, for efficiency. This computed variable will appear to change immediately based on user input, but in some cases it won't (I had issues before using a computed variable as a `slot` which was frozen, but passing it as a binding parameter was fine). 
- Computed variables can be reference in a script tag or template tag but without brackets and without arguments i.e. without brackets. They are useful if you have a value to generate based on other use choices.
- Methods need brackets to be called and are more interactive behavior or events.

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

Here we have a view such as `About.vue`, which calculates and renders results. It might use components in its template section. There might be a cleaner way to set `bar` as the result based in inputs but this works for me.

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

### Component defintion

#### Plain

```javascript
export default {
}
```

#### Extends

I think this might only be needed if you use Vue on the frontend without the Node flow.

```javascript
export default Vue.extends({
})
```

This might be needed:

```javascript
import Vue from "vue";
```

#### TypeScript

```javascript
import { defineComponent } from "vue";

export default defineComponent({
})
```

### Template on JS object

If you prefer, you can leave out the `template` tag and specify that content in the `script` tag as follows.

```javascript
export default {
   name: "Foo",
   props: {
     message: { type: String, required: true },
   },
   template: "<span>{{ message }}</span>",
};
```

This can be useful if you have Vue on the frontend without a build step, as this the template variable does not need a compilation step.


## Style section

Scope you CSS styles to the current template only.

```vue
<style scoped>
</style>
```

{% endraw %}

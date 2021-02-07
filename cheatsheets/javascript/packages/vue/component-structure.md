# Component structure

{% raw %}

## Outline

```vue
<template>
</template>

<style>
</style>

<script>
</script>
```

## Template

```html
<template>
    <span>{{ message }}</span>
</template>
```

If you prefer, specify template in the JS section.

```javascript
export default {
   name: "Foo",
   props: {
    message: { type: String, required: true },
    },
   template: "<span>{{ message }}</span>",
};
```


## Script section

Note that computed values are cached and are usually referenced like a variable but without brackets, unlike methods which need brackets to be called.

Here we have a script for a component like `TextInput.vue` that accept props.

```javascript
import Buzz from "@/components/Buzz.vue";

export default {
  name: "Foo",
  components: {
    Buzz,
  },

  props: {
    foo: { type: String, required: true },
  },

  computed: {
    newFoo() {
      return this.foo.toUppercase();
    },
    buzz() {
      return 'Buzz';
    }
  }
};
```

Here we have a view such as `About.vue`, which calculates and renders results. It might use components in its template section. There might be a cleaner way to set `bar` as the result based in inputs but this works for me.

```javascript
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
    submit: function () {
      this.bar = this.foo.toUpperCase();
    }
  }
}
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

{% endraw %}

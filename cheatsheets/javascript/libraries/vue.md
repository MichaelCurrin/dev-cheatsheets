# Vue

See [Vue](https://devhints.io/vue) on DevHints.


## Binding

See [v-bind](https://vuejs.org/v2/api/#v-bind) in the docs.

Pass string.

```html
<a href="https://example.com">...</a>
```

Pass a JS expression. Often a variable name.

```html
<a v-bind:href="url">...</a>
```

Shorthand:

```html
<a :href="url">...</a>
```

It could be a value. Note the `:` turns string `"true"` into boolean `true`.

```html
<input :required="true" />
```


## Events

If you need to be pushed back up, then use events.


```
      v-on:input="$emit('input', $event.target.value)"
```

For example, we pass a variable to a component.

```html
<TextInput
  label="Logo"
  v-model="myLogo"
/>
```

And use it.

```html
<template>
  <input
      type="text"
      :value="value"
      v-on:input="$emit('input', $event.target.value)"
      :placeholder="placeholder"
      :required="isRequired"
  />
</template>
```


## Conditional

```html
<p v-if="foo">
  {{ Bazz }}
</p>
<p v-else-if="bar">
  ...
</p>
<p v-else>
  ...
</p>
```

```html
<small class="note" v-if="note">
    <p>{{ note }}</p>
</small>
```

## Looping

```html
<li v-for="item in items"
    :key="item.id">
  {{ item }}
</li>
```

Enumerate value and index in an array. 

```html
<li v-for="(item, index) in items">...
```

Unpack key-value pairs of an associative array.

```html
<li v-for="(value, key) in myObj">...
```

Use `v-for` with a component.

```html
<my-foo v-for="item in foo"
  :foo="item"
  :key="item.id">
```

## Component structure

### Outline

```vue
<template>
</template>

<style>
</style>

<script>
</script>
```

### Template

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

### Script

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
  },
};
```

Here we have a view such as `About.vue`, which calculates and renders results. It might use components in its template section. There might be a cleaner way to set `bar` as the result based in inputs but this works for me.

```javascript
export default {
  name: "Foo",
  data() {
    return {
      foo: "Foo",
      bar: "",
    };
  methods: {
    submit: function () {
      this.bar = this.foo.toUpperCase();
    }
  }
}
```

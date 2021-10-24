# v-model with components

Listening to child component events


## Related

- [v-model cheatsheet][]

[v-model cheatsheet]: {{ site.baseurl }}{% link cheatsheets/javascript/packages/vue/directives/v-model.md %}


## Custom component

Define a variable in the output scope.

```html
const App = CreateApp({
  components: {
    CustomInput
  }
  data: {
    searchText: ''
  },
  template: `
    <CustomInput v-model="searchText" />
  `
}
```

For this to actually work though, the `<input>` inside the component must:

- Bind the value attribute to the `modelValue` prop (previously `value` in Vue 2).
- On input, emit an `update:modelValue` event with the new value.

Example definition of the component:

```javascript
const CustomInput = {
  props: [
    'modelValue'
  ],
  emits: [
    'update:modelValue'
  ],
  template: `
    <input :value="modelValue" @input="$emit('update:modelValue', $event.target.value)">
  `
})
```

Alternative using `computed` setup for `value`, passed to `input`.

```javascript
const CustomInput = {
  props: [
    'modelValue'
  ],
  emits: [
    'update:modelValue'
  ],
  computed: {
    value: {
      get() {
        return this.modelValue
      },
      set(value) {
        this.$emit('update:modelValue', value)
      }
    }
  },
  template: `
    <input v-model="value">
  `,
})
```

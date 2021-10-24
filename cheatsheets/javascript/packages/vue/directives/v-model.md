# v-model

Use variable which are on the `data` method or in `props`.


## Resources

- [v-model - Vue 3 syntax](https://v3.vuejs.org/guide/migration/v-model.html#_3-x-syntax)


## Single basic

```html
<MyComponent v-model="firstName" />
```


## Multiple bindings

You can only the `v-model` property once, but here is how to pass multiple values.

This is for Vue 3 only, according to [migration](https://v3.vuejs.org/guide/migration/v-model.html#overview) guide.

Based on [Multiple v-model bindings](https://v3.vuejs.org/guide/component-custom-events.html#multiple-v-model-bindings) in the Vue 3 docs:

```html
<MyComponent
  v-model:first-name="firstName"
  v-model:last-name="lastName"
/>
```


## Modifiers

- [Modifiers](https://v3.vuejs.org/guide/forms.html#modifiers) in the Vue 3 docs.

`v-model` has built-in modifiers - `.trim`, `.number` and `.lazy`

### Lazy

Sync on `change` event rather than `input`.

```html
<input v-model.lazy="msg" />
```

### Cast to number

```html
<input v-model.number="age" type="number" />
```

### Trim whitespace

```html
<input v-model.trim="msg" />
```


## Long vs shorthand

From [v-model migration](https://v3.vuejs.org/guide/migration/v-model.html#_3-x-syntax) doc.

### Vue 3

```html
<ChildComponent v-model:title="pageTitle" />
```

Would be shorthand for:

```html
<ChildComponent :title="pageTitle" @update:title="pageTitle = $event" />
```

### Vue 2

```html
<ChildComponent v-model="pageTitle" />
```

Would be shorthand for:

```html
<ChildComponent :value="pageTitle" @input="pageTitle = $event" />
```

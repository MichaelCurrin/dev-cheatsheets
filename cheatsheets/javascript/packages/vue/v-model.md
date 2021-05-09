# v-model


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

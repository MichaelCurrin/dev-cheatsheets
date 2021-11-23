# v-model

Use variable which are on the `data` method or in `props`.


## Resources

- [v-model - Vue 3 syntax](https://v3.vuejs.org/guide/migration/v-model.html#_3-x-syntax)


## Single

See [Using v-model on Components](https://v3.vuejs.org/guide/component-basics.html#using-v-model-on-components) in the docs.

### HTML tags

```html
<input v-model="searchText" />
```

Equivalent to:

```html
<input :value="searchText" @input="searchText = $event.target.value" />
```

### Custom component

```html
<CustomInput v-model="searchText" />
```

Equivalent to:

```html
<CustomInput :model-value="searchText" @update:model-value="searchText = $event" />
```


## Multiple bindings

You can only the `v-model` property once, but here is how to pass multiple values.

This is for Vue 3 only, according to [migration](https://v3.vuejs.org/guide/migration/v-model.html#overview) guide.

Based on [Multiple v-model bindings](https://v3.vuejs.org/guide/component-custom-events.html#multiple-v-model-bindings) in the Vue 3 docs:

```html
<MyComponent v-model:first-name="firstName" v-model:last-name="lastName"
/>
```


## Modifiers

- [Modifiers](https://v3.vuejs.org/guide/forms.html#modifiers) in the Vue 3 docs.

`v-model` has built-in modifiers:

### Lazy

Sync on `change` event rather than `input`.

```html
<input v-model.lazy="msg" />
```

### Number

Cast a value to a number

```html
<input v-model.number="age" type="number" />
```

### Trim

Remove whitespace on both ends.

```html
<input v-model.trim="msg" />
```


## Long vs shorthand

From [v-model migration](https://v3.vuejs.org/guide/migration/v-model.html#_3-x-syntax) doc.

### Vue 3

Using this:

```html
<ChildComponent v-model:title="pageTitle" />
```

Is equivalent to the long form:

```html
<ChildComponent :title="pageTitle" @update:title="pageTitle = $event" />
```

### Vue 2

Use this:

```html
<ChildComponent v-model="pageTitle" />
```

Is equivalent to the long form:

```html
<ChildComponent :value="pageTitle" @input="pageTitle = $event" />
```

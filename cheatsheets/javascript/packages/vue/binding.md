# Binding

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

It could be a value. Note use of `:` to process JS such as a value or functional call and not just plain text.

```html
<input :foo="123" />
```

Pass a boolean.

```html
<input isRequired />
```

This will appear as `isRequired` in the component with a value of `true`.

Same as:

```html
<input :isRequired="true" />
```

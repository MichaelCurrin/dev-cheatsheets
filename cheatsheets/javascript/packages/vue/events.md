# Events

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

# Events

If you need the value of variable to be pushed back up outside a component, then use Vue events.


In the docs:

- Vue 3
    - [Events](https://v3.vuejs.org/guide/events.html)
    - [Custom events](https://v3.vuejs.org/guide/component-custom-events.html)
- Vue 2
    - [Events](https://vuejs.org/v2/guide/events.html)


## Why

Events are the preferred way.

You will get unexpected behavior or build errors if you don't use events.


## Event handling

```vue
<template>
  <div id="basic-event">
    <button @click="counter += 1">Add 1</button>
    
    <p>The button above has been clicked {{ counter }} times.</p>
  </div>
</template>

export default Vue.extend({
  data() {
    return {
      counter: 0
    }
  }
})
```


## Custom events

### Syntax

Here is the syntax for adding an emit event to an input tag, with the pushed value set to the value on the element.

```
v-on:input="$emit('input', $event.target.value)"
```

### Example

For example, we pass a variable to a component like `TextInput` and then use it.

- `components/TextInput.vue`
    ```vue
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
- `App.vue`
    ```vue
    <template>
      <TextInput
        v-model="foo"
      />
    </template>

    <script>

    export default Vue.extend({
      components: {
        TextInput,
      },
      data() {
        return {
          foo: "My default value",
        };
      },
    }
    </script>
    ```

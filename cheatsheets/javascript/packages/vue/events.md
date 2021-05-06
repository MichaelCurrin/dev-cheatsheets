# Events

If you need the value of variable to be pushed back up outside a component, then use Vue events.


## Resources

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

### Log

Using `console.log` or `alert` for basic messaging.

```html
<p @click="console.log('Hello')">Click me</p>

<p v-on:click="console.log('Hello')">Click me</p>
```

### Modify data

Using events to increment a counter.

```vue
<template>
  <div id="basic-event">
    <button @click="counter += 1">Add 1</button>
    
    <p>The button above has been clicked {{ counter }} times.</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      counter: 0
    }
  }
};
</script>
```


## Custom event names

From the docs:

```javascript
this.$emit('myEvent')
```

```html
<my-component @my-event="doSomething"></my-component>
```

## Custom events

Emitted events can be defined on the component via the emits option.

```javascript
app.component('custom-form', {
  emits: ['inFocus', 'submit']
})
```


## Emit events

### Syntax

When a native event (e.g., click) is defined in the emits option, the component event will be used instead of a native event listener.

Here is the syntax for adding an emit event to an input tag, with the pushed value set to the value on the element.

```
v-on:input="$emit('input', $event.target.value)"
```

### Emit example

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
    export default {
      components: {
        TextInput,
      },
      data() {
        return {
          foo: "My default value",
        };
      },
    };
    </script>
    ```

# Emit


When a native event (e.g. `click`) is defined in the emits option, the component event will be used instead of a native event listener.

Here is the syntax for adding an emit event to an input tag, with the pushed value set to the value on the element.

```
v-on:input="$emit('input', $event.target.modelValue)"
```


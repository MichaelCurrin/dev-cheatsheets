# Custom events

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

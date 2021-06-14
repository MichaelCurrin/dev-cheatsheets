# Listen

## Sytnax

We can use the `v-on` directive, which we typically shorten to the `@` symbol, to listen to DOM events and run some JavaScript when they're triggered. The usage would be:

```
@click="methodName"
// i.e.
v-on:click="methodName"
```

e.g.

```html
<input @input="methodName" />
```

## Event types

- `@click` - when the element is clicked
- `@input` - fires when user changes input value.
- `@change` - fires when user changed value and unfocus input (for example, clicked somewhere outside)

## Calling

Pass `methodName` without brackets as a method on the component.

Or use brackets and parameters.

```html
<div id="inline-handler">
  <button @click="say('hi')">
    Say hi
  </button>
  <button @click="say('what')">
    Say what
  </button>
</div>
```
```javascript
Vue.createApp({
  methods: {
    say(message) {
      alert(message)
    }
  }
}).mount('#inline-handler')
```

Keep the original DOM event using `$event`.

```html
<button @click="warn('Form cannot be submitted yet.', $event)">
  Submit
</button>
```
```javascript
Vue.createApp({
  methods: {
    warn(message, event) {
      if (event) {
        event.preventDefault()
      }
      alert(message)
    }
  }
}
```

## Modifiers

- `.stop`
- `.prevent`
- `.capture`
- `.self`
- `.once`
- `.passive`
    

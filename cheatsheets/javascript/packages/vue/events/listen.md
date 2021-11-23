# Listen

How to listen to an event and perform an action or actions.

See [Events](https://v3.vuejs.org/guide/events.html) in Vue 3 docs.

{% raw %}


## Syntax

We can use the `v-on` directive, which we typically shorten to the `@` symbol, to listen to DOM events and run some JavaScript when they're triggered. The usage would be:

```
@click="methodName"
```

Or

```
v-on:click="methodName"
```


## Calling

### Bare

Pass `methodName` without brackets as a method on the component.

```html
<input @input="methodName" />
```

### Pass value

Or use brackets and parameters.

```html
<input @input="methodName('hello')" />
```

```html
<input @input="methodName('hello'), secondMethod('world')" />
```

Using `console.log` or `alert` for basic messaging.

```html
<p @click="console.log('Hello')">Click me</p>
```

Example:

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

### Modify data

Change a value when an event fires.

```
@click="counter += 1"
```

e.g.

- `components/Counter.vue`
    ```vue
    <template>
      <div id="basic-event">
        <button @click="counter += 1">
          Add 1
        </button>

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

### Pass original event

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

{% endraw %}

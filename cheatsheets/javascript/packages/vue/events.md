# Events

{% raw %}

If you need the value of variable to be pushed back up outside a component, then use Vue events.


## Resources

In the docs:

- Vue 3
    - [Events](https://v3.vuejs.org/guide/events.html)
    - [Custom events](https://v3.vuejs.org/guide/component-custom-events.html)
    - [v-model](https://v3.vuejs.org/guide/migration/v-model.html) and events migration from Vue 2 to 3.
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

Using events to increment a counter:

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
v-on:input="$emit('input', $event.target.modelValue)"
```

See examples below that use this.


## Two-way binding
> Pass data from a child component to a parent component

Using events is the safe way to let multiple child components change a variable in the parent level.

### Syntax

From the Vue 3 docs.

Basic. Pass a variable to a component, which must expect it as `modelValue` param.

```html
<ChildComponent v-model="pageTitle" />

<!-- would be shorthand for: -->

<ChildComponent
  :modelValue="pageTitle"
  @update:modelValue="pageTitle = $event"
/>
```

With arguments, you can change the model name. Here we pass a variable to a component, which must expect it as `title` param.

```html
<ChildComponent v-model:title="pageTitle" />

<!-- would be shorthand for: -->

<ChildComponent :title="pageTitle" @update:title="pageTitle = $event" />
```

This also serves as a replacement to `.sync` modifier and allows us to have multiple `v-models` on the custom component. Not possible in Vue 2.

Here passing `title` and `content` params.

```html
<ChildComponent v-model:title="pageTitle" v-model:content="pageContent" />

<!-- would be shorthand for: -->

<ChildComponent
  :title="pageTitle"
  @update:title="pageTitle = $event"
  :content="pageContent"
  @update:content="pageContent = $event"
/>
```

### Input event example

We pass a parent-level variable to a child component like `TextInput`. Then we use the component to modify parent variable through an event.

This relies on the standard `input` event.

Note use of `v-model="myVariable"` in the parent and `v-on:input="$emit('input', $event.target.value)"` in the child.

Vue 3 - `modelValue`. Vue 2 - `value`.

- `components/TextInput.vue`
    ```vue
    <template>
      <input
        type="text"
        :value="modelValue"
        v-on:input="$emit('input', $event.target.modelValue)"
        :placeholder="placeholder"
        :required="isRequired"
      />
    </template>
    ```
- `App.vue`
    ```vue
    <template>
      <TextInput v-model="foo" />
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

### Custom event example

My example, tested and adapted from Vue 2 doc section - [Listening to Child Components Events](https://vuejs.org/v2/guide/components.html#Listening-to-Child-Components-Events).

This uses `v-on:custom-event` in the parent and `v-on:click="$emit('custom-event')"` in the child.

#### Child components

In the component, add a button. Now, clicking this will update the parent value.

- `Hello.vue`
    ```vue
    <template>
      <button v-on:click="$emit('enlarge-text')">
        Enlarge text
      </button>
    </template>
    ```

#### App view

In `App.vue`, set up the value to be displayed and add some components.

- `App.vue`
    ```vue
    <template>
      <h2>Font size</h2>
      <p>{{ postFontSize }}</p>

      <h2>Components</h2>
      <MyComponent v-on:enlarge-text="postFontSize += 0.1" />
      <!-- Add more components if you want. -->
      <MyComponent v-on:enlarge-text="postFontSize += 0.1" />  
    </template>
    ```

And then set up the JS with your variable in `data`.

```javascript
export default Vue.extend({
  data() {
    return {
      postFontSize: 1,
    };
  },
});
```
    
If you are using **Vue Router**, you can add it to the router like this using `v-on` property:

```html
<router-view v-on:enlarge-text="postFontSize += 0.1" />
```

This means across multiple pages you can set and display the same shared variable.

If you want to actually use the value in CSS, you can do this:

```html
<div :style="{ fontSize: postFontSize + 'em' }">
```

{% endraw %}

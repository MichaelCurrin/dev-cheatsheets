---
title: Two-way binding
description: Pass data from a child component to a parent component
---

{% raw %}

Using events is the safe way to let multiple child components change a variable in the parent level.

## Resources

- [Form input bindings](https://v3.vuejs.org/guide/forms.html) in the docs
    > You can use the `v-model` directive to create two-way data bindings on form input, textarea, and select elements. It automatically picks the correct way to update the element based on the input type.


## Related

- [v-model cheatsheet][]

[v-model cheatsheet]: {{ site.baseurl }}{% link cheatsheets/javascript/packages/vue/directives/v-model.md %}


## Syntax

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


## Input event example

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


## Custom event example

My example, tested and adapted from Vue 2 doc section - [Listening to Child Components Events](https://vuejs.org/v2/guide/components.html#Listening-to-Child-Components-Events).

This uses `v-on:custom-event` in the parent and `v-on:click="$emit('custom-event')"` in the child.

### Child components

In the component, add a button. Now, clicking this will update the parent value.

- `Hello.vue`
    ```vue
    <template>
      <button v-on:click="$emit('enlarge-text')">
        Enlarge text
      </button>
    </template>
    ```

### App view

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

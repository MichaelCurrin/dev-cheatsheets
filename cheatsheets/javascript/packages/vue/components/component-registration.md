# Component registration

The basics of defining a component without caring about the contents here except for name.

Note that components actually work fine without `name`. The `name` doesn't actually get used in the output element so I don't know of its use.

See also the [Single-file components][] section.

[Single-file components]: {{ site.baseurl }}{% link cheatsheets/javascript/packages/vue/single-file-components.md %}


## Resources

Vue 3 docs

- [Component Registration](https://v3.vuejs.org/guide/component-registration.html#component-names)
- [Style Guide](https://v3.vuejs.org/style-guide/)


## Approaches

## Plain object

Create a hash/dictionary object. For both Vue 2 and 3.

Export directly when using Node.

```javascript
export default {
  name: "MyFoo",
  // ...
}
```

Create an object first and then export it, when using frontend only JS without node. If you use the component in the main script where it is defined, of course then you don't need to export it.

```javascript
const MyComponent = {
  name: "MyFoo",
  // ...
}

export default myComponent
```

### Add to app

Add a component directly to the `app` instance without defining it as a standalone object.

```javascript
const app = Vue.createApp({})

app.component('my-foo', {
  // ...
})
```

### Extends

I've used this before, but I don't know when this is needed anymore.

```javascript
import Vue from "vue";

export default Vue.extend({
  name: "MyFoo"
  // ...
})
```

### TypeScript

For Vue 3:

```javascript
import { defineComponent } from "vue";

export default defineComponent({
  name: "MyFoo"
  // ...
})
```

# Reactivity

See [Reactivity Fundamentals](https://v3.vuejs.org/guide/reactivity-fundamentals.html) in the Vue docs.


## Declaring reactive state

> To create a reactive state from a JavaScript object, we can use a reactive method:

```javascript
import { reactive } from 'vue'

const state = reactive({
  count: 0
})
```


## Create standalone reactive values as refs

> Imagine the case where we have a standalone primitive value (for example, a string) and we want to make it reactive.
>
> Of course, we could make an object with a single property equal to our string, and pass it to `reactive`.
>
> Vue has a method that will do the same for us - it's a `ref`:

```javascript
import { ref } from 'vue'

const count = ref(0)
```

> `ref` will return a reactive and mutable object that serves as a reactive reference to the internal value it is holding - that's where the name comes from.
>
> This object contains the only one property named `value`:

```javascript
import { ref } from 'vue'

const count = ref(0)
console.log(count.value) // 0

count.value++
console.log(count.value) // 1
```

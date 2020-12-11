# TypeScript support

See my starter project.

[![MichaelCurrin - vue-typescript-quickstart](https://img.shields.io/static/v1?label=MichaelCurrin&message=vue-typescript-quickstart&color=blue&logo=github)](https://github.com/MichaelCurrin/vue-typescript-quickstart)

Notes copied from the docs linked in [Resources](#resources).

## Vue 2

```vue
<script lang="ts">
import Vue from 'vue'

// Type inference enabled.
const Component = Vue.extend({
})

// No type inference.
const Component = {
}
</script>
```

## Vue 3

### Set language

```vue
<script lang="ts">
import Vue from "vue";

export default Vue.extend({
  name: "HelloWorld",
  props: {
    msg: String,
  },
});
</script>
```

### Define Vue components

```vue
<script lang="ts">
import { defineComponent } from 'vue'

const Component = defineComponent({
})
</script>
```

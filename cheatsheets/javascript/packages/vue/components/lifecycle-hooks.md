# Lifecycle hooks

## Resources

In the docs

- [Lifecycle hooks](https://v3.vuejs.org/api/options-lifecycle-hooks.html)
- [Lifecycle diagram](https://v3.vuejs.org/guide/instance.html#lifecycle-diagram)


## Common

- `created` - called after instance is created but before it is mounted.
- `mounted` - Called after the instance has been mounted
- `updated` - "Called after a data change causes the virtual DOM to be re-rendered and patched."


Sample usage on a component or view:

```vue
<script>
export default {
  created() {
    console.log("Created component");
  },
  mounted() {
    console.log("Mounted component");
  },
  updated() {
    console.log("Updated component");
  },
};
</script>
```

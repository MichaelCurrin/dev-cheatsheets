# Printing

- `console.log` - Displays the `toString` representation of any object passed to it. This can be very limited on nested objects - the value will be `Object`.
- `console.dir` - Displays interactive list of the properties of the  object. The output is presented as a hierarchical listing with disclosure triangles that let you see the contents of child objects.
- `console.error`
- `console.debug` - Useful for messages you only want to show when running the app in a more verbose debug mode.


## Timing

```javascript 
console.time("My label")

// do stuff...

console.timeEnd("My label")
```

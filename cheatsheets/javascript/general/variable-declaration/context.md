# Context

Using the `let` or `const` keyword, in place of `var`, uses a block scope so that we allow a function to "remember" the value of a variable passed into it, instead of using the outer value.

## Using block scope safely

When the variable is printed after a delay then the scoped variable is used, not the shared outer value.

We effectively have three `i` variables each with their own value.

```javascript
for (const i of [1, 2, 3]) {
  setTimeout(() => console.log(i), 1000)
}
// 1
// 2
// 3
```

### Using outer scope dangerously

If you use `var`, then the variable gets gets added to the **global** scope with the `var` keyword, then the _reference_ to the single variable is used for each function.

Here we wait one second to log the value using a callback functions. But instead of the value of `i` at the time the callback was define, we get the value of `i` _after_ the loop is done setting up the callbacks.

```javascript
for (var i of [1, 2, 3]) {
  setTimeout(() => console.log(i), 1000)
}
// 3
// 3
// 3
```

This is because the variable `i` is declared _once_ and then shared. Equivalent code to demonstrate:

```javascript
var i;

for (i of [1, 2, 3]) {
  setTimeout(() => console.log(i), 1000)
}
// 3
// 3
// 3
```

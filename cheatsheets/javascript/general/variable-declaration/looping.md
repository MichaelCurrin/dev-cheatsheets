---
title: Looping
description: Declaring variables in loops
---

It is a good idea to use `const` for your for loops.

Unless you need to change a variable deliberately, or you are using a C-style loop where your counter variable is defined initially and then incremented on each iteration.

See [Looping][] page for more info.

[Looping]: {{ site.baseurl }}{% link cheatsheets/javascript/general/looping.md %}


## Immutable for-of

```javascript
const myArray = [1, 2, 3]

for (const a of myArray) {
  console.log(a)
}
// 1
// 2
// 3
```

## Mutable for-of

Note that the variable is reassigned a new value in the `for` loop but the original array is not affected.

```javascript
const myArray = [1, 2, 3]

for (let a of myArray) {
  a = a*10
  console.log(a)
}
// 10
// 20
// 30

console.log(myArray)
[ 1, 2, 3 ]
```


## C-style loop

```javascript
const letters = ["a", "b", "c"]

for (let i = 0; i < letters.length; ++i) {
  console.log(i)

  const u = letters[i].toUpperCase()
  upper.push(u)
}
// 0
// 1
// 2

```

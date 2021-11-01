# Methods


## Class methods

Methods on classes can be set like this:

```javascript
class Foo {
  fizz(x) {
    return x * 2
  }

  buzz = (x) => x * 2
}
```


## Object methods

```javascript
const const myObj = {
  foo() {
    // ...
  },
  bar(x) {
    // ...
  }
}
```

That is shorthand for:

```javascript
const myObj = {
  foo: function() {
    // ...
  },
  bar: function(x) {
    // ...
  }
}
```

Example:

```javascript
const myObj = {
  a: 123,

  fizz(x) {
    return this.a + x
  },

  async buzz() {
    await somePromise
  }
  // ...
}

myObj.fizz(1) // 124
```

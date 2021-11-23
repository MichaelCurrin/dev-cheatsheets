## Methods

There are few kinds of syntax to define methods on an object. Whether the object is a plain object hash/dictionary, or a class.

```javascript
const username = 'abc'

const x = {
  // Set function as an attribute.
  foo: () {
    return `https://github.com/${username}`
  }
  
  // Set method directly. Neater than above.
  foo() {
    return `https://github.com/${username}`
  },
  
  // Arrow function.
  foo: () => `https://github.com/${username}`
}
```

The approaches above work for a class but just one is shown here.

```javascript
const username = 'abc'

class X {
  foo() {
    return `https://github.com/${username}`
  }
}
```

Note also you need a comma to separate methods on a hash object, but not on a class.


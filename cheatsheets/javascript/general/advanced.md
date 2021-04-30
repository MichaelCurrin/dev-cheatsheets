# Advanced

Lesser-known features of JavaScript.

Based on this video - [5 Must Know JavaScript Features That Almost Nobody Knows](https://www.youtube.com/watch?v=v2tJ3nzXh8I&list=LL).


## Nullish Coalescing

Provide an default fallback value if the variable is `null` or `undefined`.

```javascript
foo ?? 'default'
```

Note that even if the variable is falsy like `0` or an empty string, the fallback will **not** be used.

Contrast with this.

```javascript
foo || 'default'
```


## Styling Console Log

Supply CSS styling to `console.log`. Note use of `%c`.

### Single style

```javascript
console.log('%cMy red text', 'color: red')
```

### Combine styles

```javascript
console.log('%cMy bold and red text', 'font-weight: bold; color: red')
```

### Split styles

```javascript
console.log('%cMy bold text %cMy red text', 'font-weight: bold', 'color: red')
```


This only seems to work in the browser and not in Node. You'll need come control characters or an NPM package to handle colors in Node.


## Optional Chaining

You could get an error when accessing an attribute on object which is not set or missing attributes. So here we avoid that.

```javascript
foo?.bar?.bazz
```

That replaces having do this:

```javascript
foo && foo.bar && foo.bar.bazz
```

### Example

Without handling.

```javascript
const foo = {}
foo.bar.bazz
// Uncaught TypeError: Cannot read property 'bazz' of undefined
```

With handling.

```javascript
const foo = {}

// Old style.
foo && foo.bar && foo.bar.bazz
// undefined

// New style.
foo?.bar?.bazz?
// undefined
```

When the value is set.

```javascript
const foo = {
  bar: {
    bazz: 123
  }
}

// New style
foo?.bar?.bazz
// 123
foo?.badKey?.bazz
// undefined

// Old style
foo && foo.bar && foo.bar.bazz
// 123
foo && foo.badKey && foo.badKey.bazz
// undefined
```

It also works for functions.

```javascript
foo.toString?.()
// '[object Object]'

foo.badMethod?.()
// undefined

foo.badMethod()
// Uncaught TypeError: foo.badMethod is not a function
```

## Object Shorthand

```javascript
const x = 123

const y = {
  x
}

y
// { x: 123 }
```

That is the equivalent of setting:

```javascript
const y = {
  x: x
}
```

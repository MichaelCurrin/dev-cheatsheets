# Optional chaining

Lesser-known features of JavaScript.

Based on this video - [5 Must Know JavaScript Features That Almost Nobody Knows](https://www.youtube.com/watch?v=v2tJ3nzXh8I&list=LL).

Note that these are newer features and not supported by all browsers.


## Nullish coalescing

- [Nullish coalescing operator (??)](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing_operator) on Mozilla docs.
- [Can I use?](https://caniuse.com/?search=Nullish%20coalescing%20operator%20)

```javascript
VALUE ?? VALUE_IF_NULL_OR_UNDEFINED
```

Provide an default fallback value, only if the variable is `null` or `undefined`.

```javascript
foo ?? 'default'
```

Note that even if the variable is a null number (`0`) or null string (`""`),  the fallback will **not** be used.

Contrast with this broader syntax using `OR` logic, where the fallback is used on any falsy value (`null`, `undefined`, `0`, `""`, etc.)

```javascript
foo || 'default'
```


## Optional chaining for variables

When you have an object that is not null or undefined, you could still get an error when using an attribute or method on a object which is not set or missing attributes. So here we avoid that.

```javascript
VARIABLE?.ATTRIBUTE

VARIABLE?.ATTRIBUTE?.ATTRIBUTE
```

For an object `foo` with optional attribute `bar`.

```javascript
foo?.bar
```

Or method.

```javascript
foo?.fizz()
```

For an object `foo` with optional attribute `bar`, which has optional attribute `bazz`.

```javascript
foo?.bar?.bazz
```

That replaces having do this longer old format.

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


## Optional chaining for functions

Safely call a method, only if the method exists.

```javascript
VARIABLE.OPTIONAL_METHOD?.()
```

Where a standard call is:

```javascript
VARIABLE.OPTIONAL_METHOD()
```

### Examples

```javascript
const myString = 'ABC'
const myBool = true

myString.toLowerCase?.()
// 'abc'

myBool.toLowerCase?.()
// undefined
```

Standard approach:

```javascript
myString.toLowerCase()
// 'abc'

myBool.toLowerCase()
// Uncaught TypeError: myBool.toLowerCase is not a function
```

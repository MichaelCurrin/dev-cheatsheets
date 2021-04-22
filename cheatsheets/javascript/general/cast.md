---
title: Cast
description: Converting between data types
---


## Resources

- [parseInt](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/parseInt)
- [parseFloat](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/parseFloat)


## Number to string

### Integer or float

```javascript
const myNumber = 123
myNumber.toString()
// "123"
```

Optionally supply `10` as the base.

Note that a method directly on number (without a variable declared first) will give an error.

```javascript
123.toString()
// Uncaught SyntaxError: Invalid or unexpected token
```


## String to number

Remember that JavaScript as no `Int` and `Float` types, just `Number`.


### To integer

```javascript
parseInt("123")
// 123

parseInt("123.45")
// 123
```

No change on integer input.

```javascript
parseFloat(123)
// 123
```

### To float

```javascript
parseFloat("123.45")
// 123.45

parseFloat("123")
// 123
```

No change on float input.

```javascript
parseFloat(123.45)
// 123.45
```



## Other number systems

The base or `radix` defaults to `10` but you can specify others.

### Parse base 2

```javascript
parseInt("10", 2)
// 2
```

### Parse hexidecimal

```javascript
> parseInt("f", 16)
15
```

```javascript
> parseInt("0xf")
15
```

### Number base 2 sting

```javascript
const myNumber = 10

myNumber.toString(2)
// '1010'
```

### Number to base 16 string

```javascript
const myNumber = 10

myNumber.toString(16)
// 'a'
```


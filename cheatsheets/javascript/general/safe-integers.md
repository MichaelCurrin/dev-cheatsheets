# Safe integers 

JS uses 32-bit integers.

JavaScript uses double-precision floating-point format numbers as specified in IEEE 754 and can only safely represent integers between `-(2^53 - 1)` and `2^53 - 1`.


For larger integers, consider using [BigInt][].

[BigInt]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt


## Constants

The [MAX_SAFE_INTEGER][] constant has a value of `9007199254740991` (`9,007,199,254,740,991` or ~9 quadrillion). 

```js
Number.MIN_SAFE_INTEGER
Number.MAX_SAFE_INTEGER
```

[MAX_SAFE_INTEGER]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_SAFE_INTEGER


## Check 

```js
Number.isInteger(value)

Number.isSafeInteger(value)
```




# Number range

JS uses 32-bit integers.

Safe integers are all integers from -(253 - 1)^32 to +(253 - 1)^32.

This is safe: 9007199254740991. This is not safe: 9007199254740992.

## Constants

```js
Number.MIN_SAFE_INTEGER
Number.MAX_SAFE_INTEGER
```

## Check 

```js
Number.isInteger(value)

Number.isSafeInteger(value)
```




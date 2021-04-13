# Maths

## Power

```javascript
> 10**2
100
```

Or use the more verbose power function.

```javascript
> Math.pow(10, 2)
100
```


## Round

```javascript
> Math.round(1234.567)
1235
```

```javascript
> Math.round(1234.123)
1234
```

Unfortunately, passing extra parameters does **not** set the precision level.

```javascript
> Math.round(1234.123, 2)
1234
```

So you need to do this - multiple by a value, round then divide by the value. Here we use `100`, using `10` (base) to the power of `2` (precision level).

```javascript
> Math.round(1234.123 * 100) / 100
1234.12
> Math.round(1234.123 * 10**2) / 10**2
1234.12
```

As a function:

```javascript
function round(value, precision = 0) {
  const multiplier = 10 ** precision;
  return Math.round(value * multiplier) / multiplier;
}
```

Usage:

```javascript
round(1234.123, 2)
1234.12
> round(1234.12, 1)
1234.1
> round(1234.12)
1234
```

### fround

Convert from 64-bit to 32-bit precision.

See [Math.fround](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/fround) in Mozilla docs.

> The Math.fround() function returns the nearest 32-bit single precision float representation of a Number.


## Ceiling

Round up the value.

```javascript
> Math.ceil(2.3)
3
```

A negative value will round towards zero.

```javascript
> Math.ceil(-1.1)
-1
```

## Floor

Round down the value.

```javascript
> Math.floor(2.3)
2
```

A negative value will round away from zero.

```javascript
> Math.ceil(-1.1)
-2
```

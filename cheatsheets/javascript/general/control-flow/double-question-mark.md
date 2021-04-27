# Double question mark

## Syntax

Use value of `x` if it not `null` or `undefined`, otherwise use value of `y`. 

```javascript
const z = x ?? y
```

That is equivalent to:

```javascript
const z = (x !== null && x !== undefined) ?
    x :
    y;
```

Note that this does not check if `x` is truthy.

If use double pipe syntax instead, then if `x` is an empty string, zero, null, undefined, etc. then `y` will be used.

```javascript
const z = x || y
```


## Examples

```javascript
var one = 1
var two = 2
var nullValue = null
var udfValue = undefined

one ?? two
// one

nullValue ?? two
// two
udfValue ?? two
// two
```

You could use this syntax to get values in a nested object or call function in the last part.

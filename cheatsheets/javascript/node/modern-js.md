# Modern JS

## Destructure key-value pairs

Set up associative array.

```javascript
const myHash = {
  foo: 1,
  bar: 2,
  baz: 3,
  fizzer: 4
}
```

Then destructure it.

```javascript
const {foo, bar, baz, fuzz} = myHash;
```
```javascript
> foo
1
> fuzz
undefined
```
And `fizzer` was not used.

## Destructure an array

```javascript
const myArray = [1, 2, 3, 4]
```

Unpack with spread operator and variable.

```javascript
> [f, b, ...c] = myArray
[ 1, 2, 3, 4 ]
> c
[ 3, 4 ]
```
Unpack with spread operator and underscore (for REPL).

```javascript
> [f, b, ..._] = myArray
[ 1, 2, 3, 4 ]
> _
[ 3, 4 ]
```

Unpack with underscore for REPL use - gives warning.
```javascript
> [f, b, _] = myArray
Expression assignment to _ now disabled.
[ 1, 2, 3, 4 ]
> f
1
> b
2
> _
3
```

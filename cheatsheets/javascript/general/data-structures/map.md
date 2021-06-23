# Map

If you want a proper map, consider the `Map` type. It is like an Associative Array / object, is has some additional methods and is safer to use.

### Create

```javascript
new Map()
// Map(0) {}
```

```javascript
const myMap = new Map([ [ 'foo', 'bar' ], [ 'baz', 42 ] ])
// Map(2) { 'foo' => 'bar', 'baz' => 42 }

typeof myMap
'object'
```

### Set

```javascript
myMap.set('fizz', 'buzz')
Map(3) { 'foo' => 'bar', 'baz' => 42, 'fizz' => 'buzz' }
```

### Get

```javascript
myMap.get('foo')
// 'bar'

// Does not work like a plain Object.
> myMap.foo
// undefined
```


## Why use a Map

The problem with an Associative Array is when your keys collide with built-in attributes or functions.

A `Map` keeps its values separate.

e.g.

```javascript
const y = new Map( [[ 'size', 123]] )

y.size // or y['size']
// 1

y.get('size')
```

The `Map` type has a get method, which a plain Associative Array object does not.


## Methods on a Map

```
y.clear                 y.constructor           y.delete                y.entries
y.forEach               y.get                   y.has
y.keys                  y.set                   y.size                  y.values
```

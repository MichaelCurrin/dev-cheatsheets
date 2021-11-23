# Map

If you want a proper hash/map/dictionary, consider the `Map` type. 
It is like an Associative Array / Object, but it

- has some additional methods
- remembers insertion order.
- is safer - unlike an Associative Array where attributes and methods can be confused.
- you can use values other than strings as keys.

## Resources 

- [Map](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) on MDN
    > The Map object holds key-value pairs and remembers the original insertion order of the keys. Any value (both objects and primitive values) may be used as either a key or a value.


## Operations 

### Create

Empty. 

```javascript
new Map()
// Map(0) {}
```

Pass an iterable like an array of arrays.

```javascript
const myMap = new Map([
  [ 'foo', 'bar' ], 
  [ 'baz', 42 ] 
])
// Map(2) { 'foo' => 'bar', 'baz' => 42 }

typeof myMap
'object'
```

### Set

Update a key with a value.

```javascript
myMap.set('fizz', 'buzz')
// Map(3) { 'foo' => 'bar', 'baz' => 42, 'fizz' => 'buzz' }
```

### Get

Get a value by key.

```javascript
myMap.get('foo')
// 'bar'

// Does not work like a plain Object.
> myMap.foo
// undefined
```


## Iterate 

```javascript 
for (const [key, value] of myMap) {
  console.log(key, value)
}
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

The `Map` type has a `get` method, which a plain Associative Array object does not.


## Methods on a Map

```
y.clear                 y.constructor           y.delete                y.entries
y.forEach               y.get                   y.has
y.keys                  y.set                   y.size                  y.values
```


## Demo

```javascript 
const map1 = new Map();

map1.set('a', 1);
map1.set('b', 2);
map1.set('c', 3);

map1.get('a')
// 1

map1.set('a', 97);

map1.get('a')
// 97

map1.size
// 3

map1.delete('b');

map1.size)
// 2
```

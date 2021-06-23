# Object

Info on the Object type.

JavaScript does not have an array or associative array or even a class - they are just ways of using the `object` type.

The `[]` and `{}` are both ways to create an object which can be used as an array and also a dictionary/map of attributes and methods.

If you create it using `[]`, you can add key-value pairs to it as values or functions, though you shouldn't.

If you create it using `{}`, you can't `.push` like with an array.


## Use as array

```javascript
> x = []
[]
> typeof x
'object'
> y = {}
> typeof y
'object'
```

Add to array.

```javascript
> x = []
> x.push('foo')
1
> x
[ 'foo' ]
```

You can use the `Array` function to create an `object`.

```javascript
> Array(1, 2)
[ 1, 2 ]
```

You don't need the `new` keyword.


## Use as associative array

Add key and value.

```javascript
x = {}
> x.bar = 'baz'
'baz'
> x
[ bar: 'baz' ]
> y = {foo: 123}
```


Hack to add values to array - don't do this.

```javascript
> x = []
> x.bar = 'baz'
'baz'
> x
[ 'foo', bar: 'baz' ]
```

Add function.

```javascript
> x.greet = () => console.log("Hi!")
[Function (anonymous)]
> x
[ 'foo', bar: 'baz', greet: [Function (anonymous)] ]
> x.greet
[Function (anonymous)]
> x.greet()
Hi!
```

The syntax was added late to JavaScript. JavaScript classes are not really classes like in other languages, they are just `object` types.

In fact the type of a class is a function.

```javascript
> class B {constructor() {}}
> typeof B
'function'
```

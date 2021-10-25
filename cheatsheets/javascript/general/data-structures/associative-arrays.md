---
title: Associative arrays
description: aka hash, hashmap, dictionary or object
---

See [Object initializer](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer) in Mozilla docs.

In JavaScript, the common way of storing key-values pairs is an associative array.

If you want more control, use the [Map][] type instead.

[Map]: {{ site.baseurl }}{% link cheatsheets/javascript/general/data-structures/map.md %}


## Create

### Empty

```javascript
const x = {}

typeof x
// 'object'
```

Or, this works too.

```javascript
const x = Object()
// {}
```

### With values

Note use of quotes for a key with a hyphen.

```javasript
const x = {
  foo: "abc",
  bar: 123
  "fizz-buzz": true
}
```


## Get values

```javascript
const x = {
  foo: "abc",
}

x.foo
// "abc"

x['foo']
// "abc"

x.missingKey
// undefined
```

Stringify as JSON:

```javascript
const x = {
  foo: "abc",
}

// Compressed.
JSON.stringify(x)
// '{"foo":"abc"}'

// Expanded.
JSON.stringify(x, null, 2)
// {
//   "foo": "abc"
// }
```

## Unpack

See also [Looping][] cheatsheet for iterating over an associative array.

```javascript
Object.keys(x)

Object.values(x)

Object.entries(x)
```

[Looping]: {{ site.baseurl }}{% link cheatsheets/javascript/general/data-structures/looping.md %}


## Modify

```javascript
const x = {}

x.foo = 123
// OR
x['foo'] = 123

x.foo
// 123
```


## Copy

```javascript
const x = {abc: 123}

const y = {...x}

y
// {abc: 123}
```


## Merge

```javascript
const x = {abc: 123}
const y = {def: 456}

const z = {
  foo: true,
  ...x, 
  ...y
}

z
// { foo: true, abc: 123, def: 456 }
```


## Delete

```javascript
delete myObject[myKey]
```

e.g.

```javascript
const x = {abc: 123}

delete x['abc']

x
// {}
```


## Keys

### Literal key

Here, the variable `x` is ignored.

```javascript
const x = 'abc123'
// 'abc123'

const y = {
  x: 'Hello, World!'
}

y
// { x: 'Hello, World!' }
```

### Dynamic key

Here, the variable `x` is used for the key.

```javascript
const x = 'abc123'
// 'abc123'

const y = {
  [x]: 'Hello, World!'
}
y
// { abc123: 'Hello, World!' }
```


### Allowed

Note that only _strings_ are allowed for keys and other types will be converted to strings.

```javascript
{ 1: 'Hello, World!' }
// { '1': 'Hello, World!' }
```

If you want other types, use a `Map` instead




---
title: Set
description: A list of unique elements of any type.
---

Note that in JS a `Set` remembers insertion order, while in other languages like Python, it is unordered.


## Resources 

- [MDN docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set)
- [.values](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set/values)


## Create

```javascript
const x = new Set()
```

```javascript
const x = new Set(["abc", "abc", 123, "def"])
// Set( [ 123, "abc", "def" ] )
```

Order is preserved and the duplicates from later are removed.

```javascript
new Set([ 'a', 'b', 'a'])
// Set(2) { 'a', 'b' }
```


## Update 

```javascript
x.add("abc")

x.delete("abc")
```


## Check if present

```javascript
x.has("abc")
```


## Iterate

```javascript 
for (const item of mySet1) {
  console.log(item)
}
```

```javascript 
(new Set([ 'a', 'b', 'a'])).values()
// [Set Iterator] { 'a', 'b' }
```


## Cast

Convert to array.

```javascript
const mySet = new Set([ 'a', 'b', 'a'])

[...mySet]
// [ 'a', 'b' ]

Array.from(mySet)
// [ 'a', 'b' ]
```

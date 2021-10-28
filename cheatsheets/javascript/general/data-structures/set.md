---
title: Set
description: A list of unique unordered elements of any type.
---

## Resources 

- [MDN docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set)


## Create

```javascript
const x = new Set()
```

```javascript
const x = new Set(["abc", "abc", 123, "def"])
// Set( [ 123, "abc", "def" ] )
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

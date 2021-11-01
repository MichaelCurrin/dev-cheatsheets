---
title: Promises
description: Asynchronous code using callback functions, promises and async-await
---

### Summary

#### Callback

```javascript
foo('bar', function (bazz) {
  console.log(bazz.toUpperCase());
});
```

#### Promise

```javascript
foo('bar')
  .then(function (bazz) {
    console.log(bazz.toUpperCase());
  });
  .catch(function(err) {
    console.log(err.toString())
  })
```

#### Async-await

```javascript
try:
  const bazz = await foo('bar')
  console.log(bazz.toUpperCase());
catch(err) {
  console.log(err.toString())
}
```

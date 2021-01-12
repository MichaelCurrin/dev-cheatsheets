---
title: Promises
description: Asynchronous code using callback functions, promises and async-await
layout: listing
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
// Promises.
foo('bar')
  .then(function (bazz) {
    console.log(bazz.toUpperCase());
  });
```

#### Async-await

```javascript
const bazz = await foo('bar')
console.log(bazz.toUpperCase());
```

Note the last case must be used inside an `async` function only in older versions of Node. From around end of 2020 this is not a restriction in Node. Note that Deno does not have this restriction either.

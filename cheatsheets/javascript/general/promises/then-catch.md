# then-catch syntax


## Overview

Promises came late to JavaScript (they were actually in before, taken out and put back in again). They allow you to avoid nested callback functions.

The `.then` and `.catch` syntax is covered here. The more modern and easier to use syntax is using `async` and `await`.

See [Using promises](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Using_promises) guide in Mozilla docs.


## Resolve

You can create an immediately resolved promise using:

```javascript
const foo = new Promise()
foo.then(value => console.log(value))
```

Or:

```javascript
const foo = Promise.resolve(3);
foo.then(value => console.log(value))
// 3
```


## Then

```javascript
const promise = doSomething();
const promise2 = promise.then(successCallback, failureCallback);

// Or
const promise2 = doSomething().then(successCallback, failureCallback);
```

Often you'll use a call to package which handles a promise so you just to `.then()` to chain promises. 

Small example, using fat-arrow functions for readability.

```javascript
foo('bar')
  .then((resp) => resp.json())
  .then(data => console.log(data))
```

Longer chain, using `function` syntax and `.catch` at the end.
```javascript
doSomething()
  .then(function(result) {
    return doSomethingElse(result);
  })
  .then(function(newResult) {
    return doThirdThing(newResult);
  })
  .then(function(finalResult) {
    console.log('Got the final result: ' + finalResult);
  })
  .catch(failureCallback);
```


## Catch

```javascript
Promise.reject()
  .catch(failureCallback)
```

Or you can define the function in place.

```javascript
Promise.reject()
  .catch(e => console.error("Critical failure: " + e.message))
```


This is similar to synchronous code approach:

```javascript
try {
} catch(error) {
  failureCallback(error);
}
```


## All

Using `Promises.all()`. See [all](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/all) docs.

The Promise.all(iterable) method returns a single Promise that resolves when all of the promises
in the iterable argument have resolved or when the iterable argument contains no promises. It
rejects with the reason of the first promise that rejects.

```javascript
var promise1 = Promise.resolve(3);
var promise2 = 42;
var promise3 = new Promise(function(resolve, reject) {
    setTimeout(resolve, 100, 'foo');
});

Promise.all([ promise1, promise2, promise3 ]).then(function(values) {
    console.log(values);
});
// expected output: Array [3, 42, "foo"]
```

Take two arrays such as lists retrieved from two endpoints, then combine them into single array.

```javascript
var a = Promise.resolve([ 10, 20, 30 ]);
var b = Promise.resolve([ 5, 15, 40 ]);

Promise.all([ a, b ])
  .then(function(values) {
    var flat = [].concat.apply([], values);
    flat.sort((a, b) => a - b);
    console.log(flat);
});

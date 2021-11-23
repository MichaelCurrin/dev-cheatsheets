# Async-await

See [async](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/async_function) in Mozilla docs.


## Basic examples

Here we have `asyncCall` defined as an `async` function. It calls a promise that resolves after 2 seconds, to imitate doing a request to an API.

```javascript
function resolveAfter2Seconds() {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve('resolved');
    }, 2000);
  });
}

async function asyncCall() {
  console.log('calling');
  const result = await resolveAfter2Seconds();
  
  console.log(result);
  // "resolved"
}

asyncCall();
```

It uses `await` to call a function that returns a promise, so you don't have to use `.then()` chains.

Here is another example showing how `await` approach reads much more naturally.

```javascript
async function foo() {
  // Two independent await statements.
  const result1 = await new Promise((resolve) => setTimeout(() => resolve('abc')))
  const result2 = await new Promise((resolve) => setTimeout(() => resolve('def')))

  // Use result of one await call in another.
  const response = await fetch('/user.json');
  const user = await response.json();
}

foo()
```


## Top-level code vs functions

In older version of Node, you could not use `await` in the main body - you must use a wrapping async fucntion.

From around end of 2020 this is not a restriction in Node. Note that Deno does not have this restriction either.

Top-level - example from [Async/await](https://javascript.info/async-await) on JavaScript Info:

```javascript
const response = await fetch('/article/promise-chaining/user.json');
const user = await response.json();
```

The old approach using [IIFE](https://developer.mozilla.org/en-US/docs/Glossary/IIFE).

```javascript
(async () => {
  const response = await fetch('/article/promise-chaining/user.json');
  const user = await response.json();
  // ...
})();
```


## try-catch

Unlike with callback functions or `.then` promise chains, you can now use `try` and `catch` syntax.

From [docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Using_promises).

> This symmetry with asynchronous code culminates in the async/await syntactic sugar in ECMAScript 2017:

```javascript
function failureCallback(error) {
  console.error("Error generating audio file: " + error);
}

async function foo() {
  try {
    const result = await doSomething();
    const newResult = await doSomethingElse(result);
    const finalResult = await doThirdThing(newResult);
    console.log(`Got the final result: ${finalResult}`);
  } catch(error) {
    failureCallback(error);
  }
}
```


## Series vs parallel

Give a function that resolves after 2 seconds and prints the current time.

```javascript
function resolveAfter2Seconds() {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve(`resolved at ${(new Date()).toTimeString()}`);
    }, 2000);
  });
}
```

```javascript
(async function () {
  console.log((new Date()).toTimeString())

  // Here we resolve the function twice in series, taking a total of 2 seconds.

  const x = await resolveAfter2Seconds()
  console.log(x)

  const y = await resolveAfter2Seconds()
  console.log(y)
  
  // Here we resolve the promises in parallel.
  const promises = [resolveAfter2Seconds(), resolveAfter2Seconds()]
  const resolvedPromises = await Promise.all(promises)
  console.log(resolvedPromises)
})()
```

```
16:31:47 GMT+0200 (South Africa Standard Time)
resolved at 16:31:49 GMT+0200 (South Africa Standard Time)
resolved at 16:31:51 GMT+0200 (South Africa Standard Time)
[
  'resolved at 16:31:53 GMT+0200 (South Africa Standard Time)',
  'resolved at 16:31:53 GMT+0200 (South Africa Standard Time)'
]
```

Here is a similar example, having two actions depend on the same promise.

We set up function call for `resolveAfter2Seconds`, but without using `await`.

Then we set up two actions that log when the promise resolves. But the calls are not blocking so they both happen at the same time.

```javascript
(async function () {
  console.log((new Date()).toTimeString())

  const x = resolveAfter2Seconds()
  x.then((v) => console.log('done A', v))
  x.then((v) => console.log('done B', v))
})()
```

```
17:30:30 GMT+0200 (South Africa Standard Time)
done A resolved at 17:30:32 GMT+0200 (South Africa Standard Time)
done B resolved at 17:30:32 GMT+0200 (South Africa Standard Time)
```

I could not find a way to do this with `await`.

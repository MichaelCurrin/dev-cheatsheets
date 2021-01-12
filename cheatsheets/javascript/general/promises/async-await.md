# Async-await syntax

See [async](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/async_function) in Mozilla docs.


Here we have `asyncCall` defined as an `async` function.

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
  // expected output: "resolved"
}

asyncCall();
```

It uses `await` to call a function that returns a promise, so you don't have to use `.then()` chains. Here is another example showing how `await` approach reads much more naturally.

```javascript
async function foo() {
  // Two independent await statements.
  const result1 = await new Promise((resolve) => setTimeout(() => resolve('1')))
  const result2 = await new Promise((resolve) => setTimeout(() => resolve('2')))

  // Use result of one await call in another.
  const response = await fetch('/user.json');
  const user = await response.json();
}
foo()
```

Use the `async` keyword before function so you can use await on it.


## Top-level code vs functions

In older version of Node, you could not use `await` in the main body, but this has changed.

Top-level (example from [Async/await](https://javascript.info/async-await) on JavaScript Info).

```javascript
const response = await fetch('/article/promise-chaining/user.json');
const user = await response.json();
```

If you get an error with the above, you can place inside an [IIFE](https://developer.mozilla.org/en-US/docs/Glossary/IIFE).

```javascript
(async () => {
  const response = await fetch('/article/promise-chaining/user.json');
  const user = await response.json();
  // ...
})();
```

## Try catch

Unlike with callback functions or `.then` promise chains, you can now use `try` and `catch` syntax.

From [docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Using_promises).

> This symmetry with asynchronous code culminates in the async/await syntactic sugar in ECMAScript 2017:

```javascript
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

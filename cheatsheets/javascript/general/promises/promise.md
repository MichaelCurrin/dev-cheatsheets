# Promise

A promise.

```javascript
new Promise()
```

An immediately-resoving promise:

```javascript
Promise.resolve('abc')
```

An immediately-failing promise:

```javascript
Promise.reject('abc')
```

A promise that resolves after a delay, to match waiting on a network request. We pass a function

```javascript
new Promise(resolve => {
    setTimeout(() => {
      resolve(`resolved at ${(new Date()).toTimeString()}`);
    }, 2000);
  });
```

In a function:

```javascript
function resolveAfter2Seconds() {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve(`resolved at ${(new Date()).toTimeString()}`);
    }, 2000);
  });
}
```

## Promise.all

Wait for a batch of promises to resolve. The calls start at the same time and finish in any order (so this is great for requests to APIs that are independent). This will only resolve after the _last_ one has resolved.

```javascript
Promise.all(ARRAY_OF_PROMISES)
```

e.g.

```javascript
(async function () {
  console.log((new Date()).toTimeString())

  const timers = [resolveAfter2Seconds(), resolveAfter2Seconds(), resolveAfter2Seconds()]
  const values = await Promise.all(timers)
  console.log(`All done at ${(new Date()).toTimeString()}`)
  console.log({ values })
})()
```

Note this takes 2 seconds but we don't see the logs from inside each call for some reason. 

```
17:41:30 GMT+0200 (South Africa Standard Time)
All done at 17:41:32 GMT+0200 (South Africa Standard Time)
{
  values: [
    'resolved at 17:41:32 GMT+0200 (South Africa Standard Time)',
    'resolved at 17:41:32 GMT+0200 (South Africa Standard Time)',
    'resolved at 17:41:32 GMT+0200 (South Africa Standard Time)'
  ]
}
```

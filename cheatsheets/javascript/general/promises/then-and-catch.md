# Then and catch


Promises came late to JavaScript (they were actually in before, taken out and put back in again)>

Often you'll use a call to package which handles a promise so you just to `.then()` to chain promises. Here using fat-arrow functions for readability.

```javascript
foo('bar')
  .then((resp) => resp.json())
  .then(data => console.log(data))
```

You can also create an immediately resolved promise using `new Promise()`.

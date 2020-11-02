---
description: How to get data using `fetch`
---
# Fetch


## About

- Browser
    - The `fetch` function is builtin for modern browsers.
- NPM
    - [node-fetch](https://www.npmjs.com/package/node-fetch)
        - The browser `fetch` function brought to Noded.js.
        - The docs show how to use it.
    - [fetch](https://www.npmjs.com/package/fetch)
        - Unrelated to `fetch` function but shown for interest.
- [JavaScript.info](https://javascript.info/fetch) site
- [Mozilla docs](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch)

Using `fetch`. Builtin for modern browsers and you can use `node-fetch` on the server side.


## Samples

Get JSON. Basic example from the Mozilla docs.

```javascript
const url = 'http://example.com/movies.json'

fetch(url)
  .then(resp => resp.json())
  .then(data => console.log(data));
```

From `node-fetch` docs.

```javascript
const url = 'https://api.github.com/users/github'

fetch(url)
    .then(resp => resp.json())
    .then(json => console.log(json));
```

Plain HTML. From `node-fetch` docs.

```javascript
const url = 'https://github.com/'

fetch(url)
    .then(resp => resp.text())
    .then(body => console.log(body));
```

Simple POST.

```javascript
fetch('https://httpbin.org/post', { method: 'POST', body: 'a=1' })
    .then(res => res.json()) // expecting a json response
    .then(json => console.log(json));
```

POST with JSON.

```javascript
const body = { a: 1 };

fetch('https://httpbin.org/post', {
        method: 'post',
        body:    JSON.stringify(body),
        headers: { 'Content-Type': 'application/json' },
    })
    .then(res => res.json())
    .then(json => console.log(json));
```

Using `async` and `await` and error handling, from JS.info page. Note that an error will not be thrown on a non-200 status so you must handle this yourself.

```javascript
let response = await fetch(url);

// Check HTTP-status is 2XX.
if (response.ok) {
  let json = await response.json();
} else {
  alert("HTTP-Error: " + response.status);
}
```

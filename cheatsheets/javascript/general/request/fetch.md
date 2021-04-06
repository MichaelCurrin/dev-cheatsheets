---
title: fetch
description: How to get data using `fetch`
---


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

Warning - an error will **not** be thrown on a non-200 status so you must handle this yourself. Other libraries might do this differently.


## Samples

There are async and promise-based examples below. Both can be adapted to follow the other style.

### Async approach

Using the modern `async` and `await` syntax.

```javascript
const url = 'https://api.github.com/users/github'
const resp = await fetch(url);

// JSON such as from REST API or static file.
const json = await resp.json();

// Plain text such a scraping HTML.
const body = await resp.text()
```

With error handling added. Based on _JS.info_ example.

```javascript
const resp = await fetch(url);

if (resp.ok) {
  let json = await resp.json();
} else {
  alert(`HTTP-Error: ${resp.status}`);
}
```

### Promises approach

Based on Mozilla docs and `node-fetch` docs.

Warning - getting a non-2XX response will not trigger an error, so you need to add `resp.ok` check in your app.

```javascript
const url = 'https://api.github.com/users/github'

fetch(url)
  .then(resp => resp.json())
  .then(json => console.log(json);
  .catch(err => console.error(err));
```

### POST requests

#### Send form data

```javascript
const body = 'a=1';

fetch('https://httpbin.org/post', { 
    method: 'POST', 
    body,  
  })
```

#### Send JSON data

```javascript
const body = { a: 1 };

fetch('https://httpbin.org/post', {
    method: 'post',
    body:    JSON.stringify(body),
    headers: { 'Content-Type': 'application/json' },
  })
```

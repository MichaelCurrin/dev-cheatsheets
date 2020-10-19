---
description: How to fetch data using JS
---
# Fetch


## Fetch

- Browser
    - `fetch` is builtin for modern browsers.
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

Basic from the Mozilla docs.

```javascript
fetch('http://example.com/movies.json')
  .then(response => response.json())
  .then(data => console.log(data));
```

Plain HTML from node-fetch docs.

```javascript
fetch('https://github.com/')
    .then(res => res.text())
    .then(body => console.log(body));
```

Get JSON

```javascript
fetch('https://api.github.com/users/github')
    .then(res => res.json())
    .then(json => console.log(json));
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

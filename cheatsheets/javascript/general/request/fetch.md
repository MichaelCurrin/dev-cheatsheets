---
title: fetch
description: How to get data using the built-in `fetch` function
---


## About

- Browser
    - The `fetch` function is built-in for modern browsers.
- NPM
    - [node-fetch](https://www.npmjs.com/package/node-fetch)
        - The browser `fetch` function brought to Noded.js.
        - The docs show how to use it.
    - [fetch](https://www.npmjs.com/package/fetch)
        - Unrelated to `fetch` function but shown for interest.
- [JavaScript.info](https://javascript.info/fetch) site
- [Mozilla docs](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch)

Using `fetch`. Built-in for modern browsers. 

Available as a polyfill from NPM for older browsers:

- [whatwg-fetch](https://github.com/github/fetch) on GitHub.
- [fetch-polyfill](https://www.npmjs.com/package/fetch-polyfill) on NPM. Or [CDN](https://www.jsdelivr.com/package/npm/fetch-polyfill).

In Node, you can use `node-fetch` or alternatives for the server side.

Warning - an error will **not** be thrown on a non-200 status, so you must handle this yourself. Other libraries tend to handle errors for you.


## Approaches

There are async and promise-based examples below. Both can be adapted to follow the other style.

### Async approach

Using the modern `async` and `await` syntax.

```javascript
const url = "https://api.github.com/users/github"
const resp = await fetch(url);
```

Then either:

```javascript
// JSON such as from REST API or static file.
const json = await resp.json();
```

```javascript
// Plain text such as scraping HTML.
const body = await resp.text()
```

### With error handling

Use `resp.ok` to check for a success message.

```javascript
const resp = await fetch(url);
if (!resp.ok) {
  throw new Error(`${url} HTTP error: ${resp.status} - ${resp.statusText}`);
}
const data = await resp.json();
```

Based on _JS.info_ example. I don't know if `alert` will actually break the flow or code after it will still get executed.

```javascript
const resp = await fetch(url);

if (!resp.ok) {
  alert(`HTTP-Error: ${resp.status}`);
}
```

### Get response and set it on an element.

```html
<div id="result"></div>

<script>
    const URL = 'https://example.com/my-data.csv'
    const TARGET_ID = 'result'
    
    async function request(url) {
      const resp = await fetch(url);
      if (!resp.ok) {
        throw new Error(`${url} HTTP error: ${resp.status} - ${resp.statusText}`);
      }
    
      return resp.text();
    }

    (async function() {
      const text = await request(URL)
      const tableHtml = tbl(text)

      const el = document.getElementById(TARGET_ID)
      el.innerHtml = tableHtml
    })()
</script>
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

### Send data using POST request

Note that the method not case-iensitive.

#### Send JSON data

```javascript
const url = 'https://httpbin.org/post'

const body = { a: 1 };

const options = {
  method:  'POST',
  body:    JSON.stringify(body),
  headers: { 'Content-Type': 'application/json' },
}

(async function() {
  await fetch(url, options)
)()
```

Building a URL from query params.

```javascript
(async function() {
  const query = new URLSearchParams(query).toString();
  const url = `/myendpoint?${query}`;

  const options = {
    method:  'POST',
    body = JSON.stringify(body);
    headers: { 'Content-Type': 'application/json' },
  }

  const resp = await fetch(url, options);
  console.log(resp)
)()
```

A function, with error handling.

```javascript
async function request(url, body) {
  const options = {
    method: 'POST',
    body: JSON.stringify(body),
    headers: { 'Content-Type': 'application/json' },
  }

  const resp = await fetch(url, options);
  if (!resp.ok) {
    throw new Error(`${url} HTTP error: ${resp.status} - ${resp.statusText}`);
  }

  return resp.json()
}

(async function() {
  const url = 'https://httpbin.org/post'
  const respData = await request(url, options)
  console.log(respData)
)()
```

#### Send form data

```javascript
const body = 'a=1';

const options = { 
  method: 'POST', 
  body,  
}
const url = 'https://httpbin.org/post'

(async function() {
  const resp = await fetch(url, options)
  console.log(respData)
)()
```

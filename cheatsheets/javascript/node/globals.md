---
title: Globals
---

## Available

Node.js will inject these for you - you do not need to do explicity import/require.

### Process

Info on the current running process.

```javascript
process
```

You can view the entire result in the REPL.

Here are some common uses:

```javascript
process.env.Foo
process.exit(1)
```

https://nodejs.org/api/process.html

## Not available

You can't use anything browser-specific in Node.js.

```javascript
window
document
console
fetch
```

You can use a polyfill such as `node-fetch` to allow use of `fetch`.

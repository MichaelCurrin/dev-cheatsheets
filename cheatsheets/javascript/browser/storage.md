---
title: Storage API
description: Using Local and Session storage in the browser
---

## What are Local storage and Session storage?

The browser lets you a store value against a key in an in-browser database.

Up to 5MB.


## Expiration

Local storage data has **no** expiration time. It applies across tabs/windows of the same site / origin.

While session storage data gets cleared when the page session ends — that is, when the tab is closed.


## Resources

In Mozilla docs.

- [localStorage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage)
- [sessionStorage](https://developer.mozilla.org/en-US/docs/Web/API/Window/sessionStorage)

See also [Cookies][] cheatsheet.

[Cookies]: {% link cheatsheets/javascript/browser/cookies.md %}


## Methods

These work on both `localStorage` and `sessionStorage`.

- `Storage.key(n)` - return name of the Nth key.
- `Storage.getItem(keyName)` - get value by name. Returns `null` if key does not exit.
- `Storage.setItem(keyName, value)` - create or update value.
- `Storage.removeItem(keyName)` - remove key and its value.
- `Storage.clear()` - empty all keys out of the storage.


## Examples

### Scalar

Write then read a value in local storage.

```javascript
localStorage.getItem('foo')
// null

localStorage.setItem('foo', 'abc')
localStorage.getItem('foo')
// 'abc'
```

The value must be a **string**. If you set an object, the value becomes `'[object Object]'` and unusable.

### Data structures

Here we are convert an object to a string.

```javascript
const bar = { abc: 123 }
localStorage.setItem('bar', JSON.stringify(bar))
```

Then back from a string to an object.

```javascript
const barStr = localStorage.getItem('bar')
// '{ "abc": 123 }'

const bar = JSON.parse(barStr)
// { abc: 123 }
```

---
title: Storage API
description: Using Local and Session storage in the browser
---

## What are Local storage and Session storage?

The browser lets you store data against a key. Up 5MB.

Local storage data has no expiration time. It applies across tabs/windows of the same site.

While session sStorage data gets cleared when the page session ends — that is, when the page is closed.


## Resources

In Mozilla docs.

- [localStorage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage) 
- [sessionStorage](https://developer.mozilla.org/en-US/docs/Web/API/Window/sessionStorage)

See also [Cookies][] cheatsheet.

[Cookies]: {{ site.baseurl }}{% link cheatsheets/javascript/browser/cookies.md %}


## Methods

These work on both `localStorage` and `sessionStorage`.

-  `Storage.key(n)` - return name of the Nth key.
- `Storage.getItem(keyName)` - get value.
- `Storage.setItem(keyName, value)` - set or update value.
- `Storage.removeItem()` - remove key and value.
- `Storage.clear()` - empty all keys out of the storage.
    
    
## Example

Write then read a value in local storage. 

```javascript
Storage.setItem('foo', 'abc')
const foo = Storage.getItem('foo')
```

This must a **string**. If you set an object, the value becomes `'[object Object]'` and unusable.

Here converting to a string and then back from a string to an object.

```javascript
Storage.setItem('bar', JSON.stringify( { abc: 123 } )

const barStr = Storage.getItem('bar')
const bar = JSON.parse(barStr)
// { abc: 123 }
```

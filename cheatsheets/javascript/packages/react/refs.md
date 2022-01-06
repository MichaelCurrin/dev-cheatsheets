---
title: Refs
description: Used to access DOM nodes or React elements created in the render method
---

See [Refs and the DOM][] doc.

[Refs and the DOM]: https://reactjs.org/docs/refs-and-the-dom.html

## Use-cases

- Managing focus, text selection, or media playback.
- Triggering imperative animations.
- Integrating with third-party DOM libraries.

Avoid using refs for anything that can be done declaratively.


## Access refs

```javascript
const node = this.myRef.current;
```

---
title: Modules
description: How to import modules in Node
---

See docs

- https://nodejs.org/api/modules.html

## Require syntax

Using CommonJS "require" syntax.

Installed libraries.

```javascript
const request = require('request');
```

Local modules.
```javascript
const foo = require('./foo');  // or './foo.js'
```
Select an object.

```javascript
const bar = require('./foo').bar;
const { bar } = require('./foo')
```


## Import syntax

This is the modern preferred way of importing modules.

### External

```javascript
import * as foo from 'foo';
```
### Local

```javascript
import * as foo from './foo'; // or './foo.js'
```

### Entire module

```javascript
import * as foo from 'foo';
```

Then you might use `foo` or `foo.bar` depending on how the module is structured

### Selected objects

```javascript
import { foo, fuzz } from 'foo';
```

### Default

```javascript
export default foo
```
```javascript
import foo from 'foo';
```



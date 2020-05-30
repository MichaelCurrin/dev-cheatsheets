# Node Cheatsheet


## Imports

<!-- TODO: check these -->

```node
const request = require('request');

const foo = require('./foo');
const bar = require('./foo').bar;
```

```node
import { foo } from 'foo';
```


## Regex

```javascript
var text = 'Rain and Spain'
text.match(/ai/gi)
// => [ 'ai', 'ai' ]
```

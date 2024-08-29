---
description: Configure Express to serve static assets
---
# Static server

From [Static files](https://expressjs.com/en/starter/static-files.html) in the docs.


Serve a static directory. e.g. serve the `public` directory.

```javascript
app.use(express.static('public'))
```

To serve on another path e.g. server contents of `public` as a `/static`.

```javascript
app.use('/static', express.static('public'))
```

Using an absolute path is safer:

```javascript
const path = require('path')

app.use('/static', express.static(path.join(__dirname, 'public')))
```

A fuller example:

- `index.js`

```javascript
import express from "express";

const PORT = 3000

const app = express();

app.use(express.static('public'));
app.use(express.static('images'));

app.listen(PORT);
```

Or

```javascript
app.listen(PORT, () => console.log(`Example app listening at http://localhost:${port}/`));
```

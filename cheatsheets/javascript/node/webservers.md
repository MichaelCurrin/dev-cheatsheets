
# Web servers

## Express

```sh
npm install express
```

[Express starter](https://expressjs.com/en/starter/hello-world.html)

```javascript
// hello.js
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => res.send('Hello, world!'))

app.listen(port, () => console.log(`Example app listening at http://localhost:${port}/`))
```

```sh
node hello.js
```

Serve directory as static files.

```javascript
const express = require('express');
const app = express();

const port = 3000;

const p = 'build';
app.use('/', express.static(p));
app.listen(port, () => console.log(`Example app listening at http://localhost:${port}/`));
```

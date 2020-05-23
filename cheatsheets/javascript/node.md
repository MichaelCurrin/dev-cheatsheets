# Node Cheatsheet

## Imports

```node
const request = require('request');
```


## Web servers

### Express

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

app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))
```

```sh
node hello.js
```

## Read a text file

Encoding is optional.

```javascript
var fs = require('fs');

fs.readFile('file.txt', 'utf-8', (err, data) => {
    console.log(data);
});
```


See `path` lib.

https://nodejs.org/api/path.html


```javascript
const fs = require('fs');
const path = require('path');

const p = path.join(__dirname, '/foo');
```

https://alligator.io/nodejs/how-to-use__dirname/

Make directory.

```javascript
fs.mkdirSync(p);
```

Create file if it doesn't exist.

```javascript
fs.openSync(p, 'a'); 
```

```javascript
console.log(__dirname)      // "/Users/Sam/gator-app/src/api"
console.log(process.cwd())  // "/Users/Sam/gator-app"
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTAwMDYwMzk0MywtMjA4ODI3MDg1OF19
-->
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

## Files and directories

### Paths


The `__dirname` value is the full path for the current file.

```javascript
__dirname
```


Compare with the working directory.

```javascript
process.cwd()
```

https://alligator.io/nodejs/how-to-use__dirname/


### Read a text file

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


### Make directory


```javascript
fs.mkdirSync(p);
```

### Make file

Create file if it doesn't exist.

```javascript
fs.openSync(p, 'a'); 
```

Write content to file.

```javascript
var data = "New File Contents";

fs.writeFile("temp.txt", data, (err) => {
  if (err) {
    console.log(err);
  }
  console.log("Done.");
});
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTIyMDg4NzYxMywtMjA4ODI3MDg1OF19
-->
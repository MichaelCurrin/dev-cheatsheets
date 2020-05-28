# Node Cheatsheet

## Imports

```node
const request = require('request');
```

## Regex

```javascript
var text = 'Rain and Spain'
text.match(/ai/gi)
// => [ 'ai', 'ai' ]
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


See `path` lib. https://nodejs.org/api/path.html

```javascript
path.join(__dirname, '/foo');
```



```javascript
const fs = require('fs');
const path = require('path');

const p = path.join(__dirname, '/foo');

fs.readFile(p, 'utf-8', (err, data) => {
    console.log(data);
});
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

Write content to a file.

```javascript
var data = "New File Contents";

fs.writeFile("temp.txt", data, (err) => {
  if (err) {
    console.log(err);
  }
  else {
    console.log("Done.");
  }
});
```

Or. Note `SomeStream` is not defined here.

```javascript
const { createWriteStream } = require('fs');

const myStream = new SomeStream();

const writeStream = createWriteStream('file.txt');
myStream.pipe(writeStream);

myStream.write('line');
myStream.end();
```

## Modern JS

### Destructure key-value pairs

Setup associative array.

```javascript
const myHash = {
  foo: 1,
  bar: 2,
  baz: 3,
  fizzer: 4
}
```
Destructure
```javascript
const {foo, bar, baz, fuzz} = myHash;
```
```javascript
> foo
1
> fuzz
undefined
```
And `fizzer` was not used.

### Destructure an array

```javascript
const myArray = [1, 2, 3, 4]
```

Unpack with spread operator and variable.

```javascript
> [f, b, ...c] = myArray
[ 1, 2, 3, 4 ]
> c
[ 3, 4 ]
```
Unpack with spread operator and underscore (for REPL).

```javascript
> [f, b, ..._] = myArray
[ 1, 2, 3, 4 ]
> _
[ 3, 4 ]
```

Unpack with underscore for REPL use - gives warning.
```javascript
> [f, b, _] = myArray
Expression assignment to _ now disabled.
[ 1, 2, 3, 4 ]
> f
1
> b
2
> _
3
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMjcxMTM5ODM5LC02Njc4NDM3OTQsLTk2MD
gzMzU5MywtMjIwODg3NjEzLC0yMDg4MjcwODU4XX0=
-->
# Files
> Working with paths, files and directories

## Paths


The `__dirname` value is the full path for the current file.

```javascript
__dirname
```


Compare with the working directory.

```javascript
process.cwd()
```

https://alligator.io/nodejs/how-to-use__dirname/


## Read a text file

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


## Make directory


```javascript
fs.mkdirSync(p);
```

## Make file

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

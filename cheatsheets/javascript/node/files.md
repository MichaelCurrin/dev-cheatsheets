# Files
> Working with paths, files and directories


See the standard lib docs:

- [fs](https://nodejs.org/api/fs.html)
- [path](https://nodejs.org/api/path.html)


## Paths

The `__dirname` value is the full path for the current file.

```javascript
__dirname
```


Compare with the working directory.

```javascript
process.cwd()
```

From article: [How to use dirname](https://alligator.io/nodejs/how-to-use__dirname/)


## Read text file

Options can be omitted, or encoding (e.g. `utf8`) or an object (e.g. `{ encoding: 'utf8', flag: 'r' }`)

- For `fs.readFile()` method:
    - `fs.readFile(path[, options], callback)`
    - [docs](https://nodejs.org/api/fs.html#fs_fs_readfile_path_options_callback)
    - We can read a file in a **non-blocking asynchronous** way, so you need a callback.
- For `fs.readFileSync()` method:
    - `fs.readFileSync(path[, options])`
    - [docs](https://nodejs.org/api/fs.html#fs_fs_readfilesync_path_options)
    - We can read files in a **synchronous** way, i.e. we are telling node.js to block other parallel process and do the current file reading process. 

Using async way.

```javascript
var fs = require('fs');

fs.readFile('file.txt', 'utf-8', 
    (err, data) => {
        if (err) {
            console.log(err); 
        }
        else {
            console.log(data); 
        }
});
```

Using sync way. If there is a problem, an error will be thrown and you won't get to the last line. So you will need `try catch` logic.

```javacript
var fs = require('fs');

fs.readFileSync('file.txt', 'utf-8')
console.log(data); 
```

Above we used path as `file.txt`.

Or get the full path.

```javascript
path.join(__dirname, 'foo');
```

For example:

```javascript
const fs = require('fs');
const path = require('path');

const p = path.join(__dirname, 'foo');

fs.readFile(p, 'utf-8', 
    (err, data) => {
        if (err) {
            console.log(err); 
        }
        else {
            console.log(data); 
        }
});
```


## Make directory

```javascript
fs.mkdirSync(p);
```


## Make file

Create a file if it doesn't exist.

```javascript
fs.openSync(p, 'a');
```

Write content to a file.

- Write file - async
    - `fs.writeFile(file, data[, options], callback)`
    - [docs](https://nodejs.org/api/fs.html#fs_fs_writefile_file_data_options_callback)
- Write file - sync
    - `fs.writeFileSync(file, data[, options])`
    - [docs](https://nodejs.org/api/fs.html#fs_fs_writefilesync_file_data_options)

```javascript
var data = "New File Contents";

fs.writeFile("temp.txt", data, 
  (err) => {
      if (err) {
        console.log(err);
      }
      else {
        console.log("Done.");
      }
});
```

Or with a stream.

```javascript
const { createWriteStream } = require('fs');

// Replace with your own stream.
const myStream = new SomeStream();

const writeStream = createWriteStream('file.txt');
myStream.pipe(writeStream);

myStream.write('line');
myStream.end();
```

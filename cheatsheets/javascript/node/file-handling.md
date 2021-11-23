# File handling
> Working with paths, files and directories


## Resources

See the standard lib docs:

- [fs](https://nodejs.org/api/fs.html)
- [path](https://nodejs.org/api/path.html)


## Imports

ES Modules:

```javascript
import * as fs from 'fs';
import * as path from 'path';
```

CommonJS imports, or if you get an error that you can't use `import` outside a module.

```javascript
const fs = require('fs');
const path = require('path');
```


## Paths

### Current module's directory vs working directory

The `__dirname` value is the full path for the current file.

```javascript
__dirname
```

Compare with the working directory.

```javascript
process.cwd()
```

From article: [How to use dirname](https://alligator.io/nodejs/how-to-use__dirname/)

### Full path

Absolute path to the file.

There are a few approaches on StackOverflow and not clear best approach.

```javascript
path.join(__dirname, 'foo');
```

Or

```javascript
path.resolve('foo');
```

Or

```javascript
path.resolve(__dirname, 'foo');
```


## Read text file

- For `fs.readFile()` method:
    - `fs.readFile(path[, options], callback)`
    - [docs](https://nodejs.org/api/fs.html#fs_fs_readfile_path_options_callback)
    - We can read a file in a **non-blocking asynchronous** way, so you need a callback.
- For `fs.readFileSync()` method:
    - `fs.readFileSync(path[, options])`
    - [docs](https://nodejs.org/api/fs.html#fs_fs_readfilesync_path_options)
    - We can read files in a **synchronous** way, i.e. we are telling Node.js to block other parallel process and do the current file reading process. 

That will open and close the file you. 

### Options

Options can be:

- omitted - but then you'll get binary data and a text file will look garbled: `<Buffer 7b 0a 20 6e ... 205 more bytes>`
- encoding e.g. `utf-8` is common. The flag will default to `'r'`.
- an object of encoding and flags like mode. e.g. `{ encoding: 'utf8', flag: 'r' }`

### Callback

The `callback` function is required for `readFile`.

### Examples

Using the async way with `readFile`.

```javascript
import fs from 'fs';

const filePath = 'file.txt'
await fs.readFile(
  filePath, 
  'utf-8', 
  (err, data) => {
    if (err) {
      throw err; 
    }
    console.log(data); 
});
```

It looks like it always returns `undefined`, even if y ou use `return data` in the callback. So I guess you could set an object outside `readFileSync` and maybe use `await`, or just use `readFileSync` to keep it simple.

Using an absolute path.

```javascript
import * as fs from 'fs';
import * as path from 'path';

const p = path.join(__dirname, 'foo');

fs.readFile(p, 'utf-8', 
  (err, data) => {
    if (err) {
      throw err; 
    }
    console.log(data); 
});
```

Using the synchronous way with `readFileSync`. If there is a problem, an error will be thrown and you won't get to the last line. So you will need `try catch` logic.

```javascript
import fs from 'fs';

const filePath = 'file.txt'
const contents = fs.readFileSync(filePath, 'utf-8')
console.log(contents); 
```

Here is as script you can use as a standalone file, using CommonJS imports and an enclosing async function.

- `index.js`
    ```javascript
    const fs = require('fs');
    const path = require('path');

    (async function () {
      const myPath = 'foo.txt'
      const p = path.join(__dirname, myPath);

      const value = fs.readFileSync(p, "utf-8")
      console.log(value)

      await fs.readFile(p, "utf-8",
        (err, data) => {
          if (err) {
            throw err;
          }
          console.log(data);
        }
      )
    })()
    ```
    
```sh
$ node index.js
```


### Open and close

Use `open` and `close` explicitly:

```javascript
import { open } from 'fs/promises';

let filehandle;
try {
  filehandle = await open('thefile.txt', 'r');
} finally {
  await filehandle?.close();
}
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
const data = "New File Contents";

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


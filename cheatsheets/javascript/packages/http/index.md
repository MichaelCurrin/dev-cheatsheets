# http

How to use the built-in `http` library - from [tutorial](https://www.w3schools.com/nodejs/nodejs_http.asp).

See also my [gist](https://gist.github.com/MichaelCurrin/1a6116a4e0918c8468dc7e1a701a5f95).

This is very low-level. You probably want to use Express or something at an even higher-level.

Make a script.

- `index.js`
    ```js
    const http = require('http');

    http.createServer(function (req, res) {
      res.write('Hello World!');
      res.end();
    }).listen(8080); 
    ```

Then run it:

```sh
node index.js
```

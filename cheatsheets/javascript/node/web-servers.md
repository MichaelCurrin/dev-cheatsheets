# Web servers


## Start a server

The general ways to start a server.

### Node

Run as:

```sh
$ node server.js
```

### NPM

This will lookup `server.js` by default.

```sh
$ npm serve
```


## HTTP

Using the Node builtin module.

See [HTTP](https://nodejs.org/api/http.html) module docs.

### Basic

Example based on [Getting started with NodeJS for frontend developers - Part 1](https://www.youtube.com/watch?v=F3eiqoNTniY&t=41s).

Set up HTTP server with returns a greeting as plain text.

- `server.js`
    ```javascript
    const http = require('http')

    http.createServer((req, resp) => {
      resp.writeHead(200, { 'Content-Type': 'text/html' });
      resp.write(`<p>Hello, world! You requested ${req.url}</p>`);
      resp.end();
    }).listen(3000);
    ```

Start the app. Note you won't see any output and this is a blocking call.

Then open the browser at:

- [localhost:3000/](http://localhost:3000/)

Note that you can use any path and you'll get the same response.

### Parse the query string

Based on [Node.js HTTP Module](https://www.w3schools.com/nodejs/nodejs_http.asp) on W3 Schools.

Use the `url` builtin module.

```javascript
var http = require('http');
var url = require('url');

http.createServer(function (req, res) {
  res.writeHead(200, { 'Content-Type': 'text/html' });

  var q = url.parse(req.url, true).query;
  var text = q.year + " " + q.month;
  res.end(text);
}).listen(3000);
```

Open in the browser:

-  [localhost:8080/?year=2017&month=July](http://localhost:8080/?year=2017&month=July)

Result:

```
2017 July
```


## 3rd-party packages

See the [Express static server][] page for using Express.

[Express static server]: {% link cheatsheets/javascript/packages/express/static-server.md %}

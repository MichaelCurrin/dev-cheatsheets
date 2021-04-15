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


## Express

## Resources

- [expressjs.com](https://expressjs.com/) homepage.
- [express](https://www.npmjs.com/package/express) package on NPM.

See also project - [MichaelCurrin/express-js-rest-quickstart](https://github.com/MichaelCurrin/express-js-rest-quickstart). Including the notes in the docs.

### Install

Install Express.

```sh
$ npm install express
```

Note that `return` is not used in examples below - just `resp.send`.

### Basic greeting

[Express starter](https://expressjs.com/en/starter/hello-world.html)

- `server.js`
    ```javascript
    const express = require('express');

    const app = express();
    const port = 3000;

    app.get('/', (req, resp) => resp.send('Hello, world!'))

    app.listen(port, () => console.log(`Example app listening at http://localhost:${port}/`))
    ```

Run as:

```sh
$ node server.js
Example app listening at http://localhost:3000/
```

Open browser at:

- [localhost:3000/](http://localhost:3000/)

Note that you'll get an error on other paths.


### Handle query parameters

Example based on [Getting started with NodeJS for frontend developers - Part 2](https://www.youtube.com/watch?v=HL7J3GT5v14).


Add the following to base example, before `.listen`.

Note use of `.query`.

- `index.js`
    ```javascript
    app.get('/foo', (req, resp) => {
      const { name } = req.query;
      resp.send(`Hello, ${name || world}!`);
    })
    ```

Test on:

- [localhost:3000/foo?name=Bar](http://localhost:3000/foo?name=Bar)


### Handle URL parameters

Add the following to base example, before `.listen`.

Note use of `.params`.

```javascript
app.get('/foo/:name', (req, resp) => {
    const { name } = req.params;
    resp.send(`Hello, ${name || world}!`);
})
```

Test on:

- [localhost:3000/foo/Bar](http://localhost:3000/foo/Bar)


### Handle POST request

- `index.js`
    ```javascript
    app.use(express.json());
    app.use(express.urlencoded());

    app.post('/foo', (req, res) => {
      res.status(201)
        .send({
          message: "Created a foo using data",
          data: req.body,
        });
    });
    ```

### Handle other status codes

- `index.js`
    ```javascript
    app.get('/admin', (_req, res) => {
        res.sendStatus(401);
    });
    ```

### Static files

Serve a directory of static files.

- `index.js`
    ```javascript
    const express = require('express');

    const app = express();
    const port = 3000;
    const staticDir = 'build';

    app.use('/', express.static(staticDir));
    app.listen(port, () => console.log(`Example app listening at http://localhost:${port}/`));
    ```

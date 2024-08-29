# API


## Handle query parameters

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


## Handle URL parameters

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


## Handle POST request

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

## Handle other status codes

- `index.js`
    ```javascript
    app.get('/admin', (_req, res) => {
        res.sendStatus(401);
    });
    ```

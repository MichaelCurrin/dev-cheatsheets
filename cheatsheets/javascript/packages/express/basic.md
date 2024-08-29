# Basic

## Basic greeting

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

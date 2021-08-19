---
title: Dev server
---

See [Dev Server](https://webpack.js.org/configuration/dev-server/) in the docs.


## Install

```sh
$ npm install -D webpack-dev-server
```


## Configure

If you have a `public/index.html` in version control and export as unversioned `public/bundle.js`, you can set up the dev server also serve the contents of `public` on the root.

e.g.

- `webpack.js`
    ```javascript
    const path = require('path');

    module.exports = {
      mode: "development",
      devtool: "eval-source-map",
      
      output: {
        path: path.resolve('public'),
        filename: 'bundle.js',
      },

      devServer: {
        static: "./public",
      },
    };
    ```

## Run

```sh
$ npx webpack serve
```

_Deprecation warning: The `webpack-dev-server` command no longer works from Webpack 5. Using the command above._

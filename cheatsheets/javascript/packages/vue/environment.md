---
title: Environment
description: How to choose the environment for your Vue app
---

## Serve

This defaults to using dev set up.

```sh
$ yarn serve
```

Runs `vue-cli-service serve`



## Build

Vue will default to setting `NODE_ENV` as `production`, to minify content and adjust paths.

```sh
$ yarn build
```

Runs `vue-cli-service build`

If you want to dev build:

```sh
$ NODE_ENV=dev yarn build
```


## Public path

For serving on a subpath like a GitHub Pages project site, set this up.

On a dev setup (build or serve), you'll use the root and on a production setup you'll use a subpath like `/my-repo`.
- `vue.config.js`
    ```javascript
    module.exports = {
      publicPath: process.env.NODE_ENV === "production" ? "/my-repo/" : "/",
    };
  ```

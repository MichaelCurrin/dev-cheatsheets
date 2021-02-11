---
title: Install
description: How to install the Vue CLI
```


## Install globally

```sh
$ npm install -g @vue/cli
```

Or

```sh
$ yarn install -g @vue/cli
```

Then run as:

```sh
$ vue
```


## Add to project

```sh
$ npm install @vue/cli
```

Or

```sh
$ yarn add @vue/cli
```

That will be installed as `vue` in your `package.json` dependencies.

Execute it in your `node_modules` as:

```sh
$ npx vue-cli-service COMMAND
```

Or setup in your `package.json` scripts.

```json
{
  "scripts": {
    "serve": "vue-cli-service serve"
  }
}
```

Then run as:

```sh
$ npm run serve
```

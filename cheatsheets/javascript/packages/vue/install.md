---
title: Install
description: How to install the Vue CLI
---


## Related

- [CLI][] cheatsheet - For more info on running Vue commands.
- [Quickstart][]

[CLI]: {{ site.baseurl }}{% link cheatsheets/javascript/packages/vue/cli.md %}
[Quickstart]: {{ site.baseurl }}{% link cheatsheets/javascript/packages/vue/quickstart.md %}


## Install globally

```sh
$ npm install -g @vue/cli
```

Or

```sh
$ yarn global add @vue/cli
```

Then run using:

```sh
$ vue COMMAND
```


## Install as project package

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

Or set up in your `package.json` scripts.

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

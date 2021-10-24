
# Vue CLI Service

See [CLI Service](https://cli.vuejs.org/guide/cli-service.html) command docs.

Available by installing `@vue/cli-service`. But I think installing `vue` is sufficient.

Run it as an NPM script.

Or as:

```sh
$ npx vue-cli-service COMMAND
```


## Help

```
Usage: vue-cli-service serve [options] [entry]

Options:

  --open         open browser on server start
  --copy         copy url to clipboard on server start
  --mode         specify env mode (default: development)
  --host         specify host (default: 0.0.0.0)
  --port         specify port (default: 8080)
  --https        use https (default: false)
  --public       specify the public network URL for the HMR client
  --skip-plugins comma-separated list of plugin names to skip for this run
```


## Start dev server

```sh
$ vue-cli-service serve
```


## Build

This will clean (remove old assets) by default.
```sh
$ vue-cli-service build
```

```sh
$ vue-cli-service build --no-clean
```


## Lint

Fix:

```sh
$ vue-cli-service lint
```

Check:

```sh
$ vue-cli-service lint --no-fix
```

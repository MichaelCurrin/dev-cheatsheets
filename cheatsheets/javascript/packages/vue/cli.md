# CLI


## Vue command

If you have Vue installed globally, you can run as:

```sh
$ vue COMMAND [OPTIONS]
```

Otherwise, run as:

```sh
$ npx @vue/cli COMMAND [OPTIONS]
```

### Help

```sh
$ vue -h
```
```
Usage: vue <command> [options]

Options:
  -V, --version                              output the version number
  -h, --help                                 output usage information

Commands:
  create [options] <app-name>                create a new project powered by vue-cli-service
  add [options] <plugin> [pluginOptions]     install a plugin and invoke its generator in an already created project
  invoke [options] <plugin> [pluginOptions]  invoke the generator of a plugin in an already created project
  inspect [options] [paths...]               inspect the webpack config in a project with vue-cli-service
  serve [options] [entry]                    serve a .js or .vue file in development mode with zero config
  build [options] [entry]                    build a .js or .vue file in production mode with zero config
  ui [options]                               start and open the vue-cli ui
  init [options] <template> <app-name>       generate a project from a remote template (legacy API, requires @vue/cli-init)
  config [options] [value]                   inspect and modify the config
  outdated [options]                         (experimental) check for outdated vue cli service / plugins
  upgrade [options] [plugin-name]            (experimental) upgrade vue cli service / plugins
  migrate [options] [plugin-name]            (experimental) run migrator for an already-installed cli plugin
  info                                       print debugging information about your environment

  Run vue <command> --help for detailed usage of given command.
```

### Create

See [Creating a project](https://cli.vuejs.org/guide/creating-a-project.html) in the docs. That covers the `create` and `ui` commands.

If you have Vue installed globally, you can run this.

```sh
$ vue create
```

Without Vue installed globally, use `npx` to download and execute the Vue CLI. This is useful for setting up a new project as this works even if Vue is not installed anywhere.

```sh
$ npx @vue/cli create my-app
$ cd my-app
```

Choose _manual_ options if you want to add TypeScript.

Use the default flag if you want to skip prompts and use defaults.

```sh
$ npx @vue/cli create my-app --default
```

### UI

Start the Vue GUI tool. To create or manage a Vue project, such as adding dependencies.

```sh
$ npx @vue/cli ui
```


## CLI Service

See [CLI Service](https://cli.vuejs.org/guide/cli-service.html) command docs.

Available by installing `@vue/cli-service`. But I think installing `vue` is sufficient.

Run it as an NPM script.

Or as:

```sh
$ npx vue-cli-service COMMAND
```

### Help

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

### Start dev server

```sh
$ vue-cli-service serve
```

### Build

```sh
$ # Clean.
$ vue-cli-service build

$ # Don't clean.
$ vue-cli-service build --no-clean
```

### Lint

```sh
$ # Fix
$ vue-cli-service lint

$ # Don't fix.
$ vue-cli-service lint --no-fix
```

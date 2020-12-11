# CLI


## Install

Optionally use the `--global` flag.

```sh
$ vue install @vue/cli
$ yarn add @vue/cli
```

That will be installed as `vue` in your `package.json` packages.


## Help


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



## Commands

```sh
$ vue --help
$ vue create
$ vue ui
```

Run without Vue installed globally or in your project. This is useful for setting up a new project.

```sh
$ npx vue create my-app
$ npx @vue/cli create --default my-project
```

## Vue CLI Service

You can run this after `vue` is installed.

Usually as an NPM script but also available as `npx vue-cli-service COMMAND`

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

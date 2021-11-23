# Vue command


## Usage

If you have Vue installed globally, you can run as:

```sh
$ vue COMMAND [OPTIONS]
```

Otherwise, run with `npx` as as:

```sh
$ npx @vue/cli COMMAND [OPTIONS]
```


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


## Create

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


## UI

Start the Vue GUI tool. To create or manage a Vue project, such as adding dependencies.

```sh
$ npx @vue/cli ui
```

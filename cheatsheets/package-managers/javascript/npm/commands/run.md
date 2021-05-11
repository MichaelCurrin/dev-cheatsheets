---
description: About the `npm run` command
---
# run


Typically this used as:

```sh
$ npm run COMMAND
```

Where `COMMAND` is a value from the `scripts` section of `package.son`.


## CLI

### Help

See [npm run-script](https://docs.npmjs.com/cli/run-script) in the docs.

```
npm run-script <command> [--silent] [-- <args>...]

alias: npm run
```

### Flags

> You can use the --if-present flag to avoid exiting with a non-zero exit code when the script is undefined. This lets you run potentially undefined scripts without breaking the execution chain.

e.g.

```sh
$ npn run build --if-present
```


## Pass ad hoc arguments

Use `--` to indicate end of `npm run` arguments and then you can add the additional arguments.

```sh
$ npm run COMMAND -- OPTIONS
```

For example, if you run these commands:

```sh
$ npm run lint
$ npm run lint -- --fix
```

Then you'll get these respectively:

```sh
$ eslint .
$ eslint . --fix
```

Though, I prefer to set up `npm run lint:fix` as a separate script command so run the `--fix` command for me.

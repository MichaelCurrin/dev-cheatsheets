# How to run commands

## Without the run command

Some special commands are special and don't need `npm run COMMAND` for the prefix.

```sh
$ npm start
$ npm test
$ npm version
```

You can also run them more verbosely but there is no point.

```sh
$ npm run start
```


## Using the run command

Other commands need `run`.

```sh
$ npm run build
```

Example configuration:

```json
{
  "name": "example-basic",
  
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test --env=jsdom"
  }
}
```

If you do not specify `start`, then the `main` field will be used as a Node script to run. It is the same if you set a `start` script command as `node server.js`.

```json
{
  "name": "example-basic",
  "main": "server.js"
}
```

```sh
$ npm start
```

If you _do_ specify `start`, you should probably omit the `main` field, as you won't use it.


## List

Using `run` without arguments will list the configured commands. 

```sh
$ npm run
```

```
Lifecycle scripts included in example-basic:
  start
    react-scripts start
  test
    react-scripts test --env=jsdom

available via `npm run-script`:
  build
    react-scripts build
  eject
    react-scripts eject
```

Note that `npm run` and `npm run-script` are equivalent.


## Linting

Call a script command using the same target in the command-line as in the `package.json` file.

```sh
$ npm run lint
$ npm run lint:src
```

```json
{
  "scripts": {
    "lint:src": "eslint src test build",
    "lint": "npm run lint:src && npm run lint:examples",
   }
}
```

If you need to run a dependency like `eslint` alone, then use one of these approaches, otherwise the package will not found:

- NPX
    ```sh
    $ npx eslint --help
    ```
- Node modules path.
    ```sh
    $ node_modules/.bin/eslint --help
    ```

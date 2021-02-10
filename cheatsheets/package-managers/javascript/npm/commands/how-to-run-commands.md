# How to run commands


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


## Server script

You can leave out specifying `start` if you want.

Then you need a script at the top-level named `server.js` - NPM will look for this by name.

You can _optionally_ add the server script to `main` field to set an entrypoint, but it runs fine without it and it doesn't seem to work to tell NPM to point at another script.

```json
{
  "name": "example-basic",
  "main": "server.js"
}
```

Then run:

```sh
$ npm start
```


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

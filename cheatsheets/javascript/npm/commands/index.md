---
description: How to run the NPM CLI's commands
layout: listing
---
# Commands



**Sample**

Some commands are special and don't need `npm run COMMAND` for the prefix.

```sh
$ npm start
$ npm test
```

```sh
$ npm run build
$ npm run eject
```

```json
{
  "name": "example-basic",

  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test --env=jsdom",
    "eject": "react-scripts eject"
  }
}
```

Running without arguments gives configured commands:

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

It seems that `npm run` and `npm run-script` are equivalent.


**Sample**

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

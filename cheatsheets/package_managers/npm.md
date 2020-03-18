# NPM cheatsheet

- [npmjs.com](https://www.npmjs.com)

## Package

About `package.json` for NPM.

- [Create a package.json file](https://docs.npmjs.com/creating-a-package-json-file) tutorial on NPM docs.

### Base

A `package.json` based on the default you get fron `npm init`.

**Sample**

The empty are usually omitted but added here for readibility and grouping of related areas.

```json
{
    "name": "package-name",
    "description": "Foos all the bars",
    
    "version": "1.0.0",
    "keywords": [
        "foo",
        "bar"
    ],
    "author": "FIRSTNAME SURNAME <FIRSTNAME.SURNAME@gmail.com> (https://github.com/USERNAME)",
    "license": "MIT",
    
    "main": "index.js",
    "scripts": {
      "test": "echo \"Error: no test specified\" && exit 1"
    },
    
    "homepage": "https://github.com/USERNAME/REPO_NAME.git",
    "repository": {
      "type": "git",
      "url": "https://github.com/USERNAME/REPO_NAME.git"
    },
    "bugs": {
      "url": "https://github.com/USERNAME/REPO_NAME/issues"
    }
 }
```

### Files

**Sample**

```json
{
  "main": "lib/index.js",
  "files": [
    "dist",
    "lib",
    "es",
    "src"
  ],
}
```

### Dependencies

**Sample**

```json
{
  "devDependencies": {
    "react-scripts": "^0.6.1"
  },
  "dependencies": {
    "history": "^4.2.0",
    "prop-types": "^15.5.9",
    "react": "^16.1.1",
    "react-dom": "^16.1.1",
    "react-url-query": "^1"
  }
}
```


### Commands


**Sample**

These are special and don't need `npm run`.

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

It seems that `npm run` and `npm run-script` are equivalenet, from basic testing.


**Sample**

```sh
$ npm run lint
$ npm run lin_examples
```

```json
{
  "scripts": {
    "lint": "npm run lint:src && npm run lint:examples",
    "lint:src": "eslint src test build",
   }
}
```

# NPM cheatsheet

- [npmjs.com/](https://www.npmjs.com/)

## Package

About `package.json` for NPM.

- [Create a package.json file](https://docs.npmjs.com/creating-a-package-json-file) tutorial on NPM docs.

### Base

```json
{
    "name": "package-name",
    "description": "",
    "version": "1.0.0",
    "main": "index.js",
    "scripts": {
      "test": "echo \"Error: no test specified\" && exit 1"
    },
    "repository": {
      "type": "git",
      "url": "https://github.com/USERNAME/REPO_NAME.git"
    },
    "keywords": [],
    "author": "",
    "license": "ISC",
    "bugs": {
      "url": "https://github.com/USERNAME/REPO_NAME/issues"
    },
    "homepage": "https://github.com/USERNAME/REPO_NAME.git"
 }
```

### Dependencies

Sample

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


Sample

```sh
$ npm start
$ npm test

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

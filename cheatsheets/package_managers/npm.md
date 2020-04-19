# NPM cheatsheet

- NPM homepage: [npmjs.com](https://www.npmjs.com)


## Update

```sh
$ npm i -g --update npm
```

## Package

About `package.json` for NPM.

- NPM docs
    - [Package.json](https://docs.npmjs.com/files/package.json) doc - includes definitions and examples of fields.
    - [Create a package.json file](https://docs.npmjs.com/creating-a-package-json-file) tutorial.

### Base

A `package.json` based on the default you get fron `npm init`.

**Sample**

```json
{
    "name": "package-name",
    "description": "Foo all the bars",
    
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
    
    "repository": {
      "type": "git",
      "url": "https://github.com/USERNAME/REPO_NAME.git"
    },
    "bugs": {
      "url": "https://github.com/USERNAME/REPO_NAME/issues"
    }
 }
```

Notes:

- The empty are added here for readibility and grouping of related areas - when you do an `npm` command which updates your `package.json` file, all the empty lines will be removed.
- From the docs: "If you don’t plan to publish your package, the name and version fields are optional."
- Optionally include "homepage" with a URL such as Github Pages to Netlify URL for the service or docs site.

### Author

Either of these are fine as `"author"` values, according to the docs.

```json
{
    "name" : "Barney Rubble", 
    "email" : "b@rubble.com", 
    "url" : "http://barnyrubble.tumblr.com/"
}
```

```json
"Barney Rubble <b@rubble.com> (http://barnyrubble.tumblr.com/)"
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

It seems that `npm run` and `npm run-script` are equivalent, from basic testing.


**Sample**

Call a script command using the same target in the command-line as in the `package.json` file.
```sh
$ npm run lint
$ npm run lint:src
```

```json
{
  "scripts": {
    "lint": "npm run lint:src && npm run lint:examples",
    "lint:src": "eslint src test build",
   }
}
```

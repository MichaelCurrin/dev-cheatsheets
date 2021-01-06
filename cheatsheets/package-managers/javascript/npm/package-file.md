---
description: About the package.json for managing NPM packages
---
# Package file


## Resources

NPM docs:

- [Package.json](https://docs.npmjs.com/files/package.json) doc - includes definitions and examples of fields.
- [Create a package.json file](https://docs.npmjs.com/creating-a-package-json-file) tutorial.


## Base

A `package.json` file, based mostly on the default one you get fron `npm init` and accepting defaults. Spaces will be removed by NPM but help here for readability.

It can be useful to put `scripts` near the top like here and dependencies at the bottom, to make it easy to regularly check what scripts are configured.

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
- Optionally include "homepage" with a URL such as GitHub Pages to Netlify URL for the service or docs site.

See my customized [package.json](https://github.com/MichaelCurrin/node-project-template/blob/master/package.json) file in my `node-project-template` repo.


## Fields

### Author

Either of these are fine as `"author"` values, according to the docs.

```json
{
    "name" : "Barney Rubble",
    "email" : "b@rubble.com",
    "url" : "https://barnyrubble.tumblr.com/"
}
```

```json
"Barney Rubble <b@rubble.com> (s)"
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

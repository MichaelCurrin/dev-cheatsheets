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

**Sample**

The first half of the fields are useful for most projects. 

The fields from `"displayName"` on are only really useful if you are **publishing*** your project as an installable package on NPM, since the fields will appear in the NPM registry UI. Otherwise they are not so useful for viewing on a GitHub repo, such as a web app which is for serving and not for installing as a package.

- `package.json`
    ```json
    {
      "name": "my-package",
      "version": "1.0.0",

      "main": "index.js",
      "scripts": {
        "test": "echo \"Error: no test specified\" && exit 1"
      },
      "dependencies": {
      },
      "devDependencies": {
      },

      "author": "FIRSTNAME SURNAME <FIRSTNAME.SURNAME@gmail.com> (https://github.com/USERNAME)",
      "license": "MIT",

      "displayName": "My Package",
      "description": "Foo all the bars",

      "homepage": "https://github.com/USERNAME/REPO_NAME#readme",
      "repository": {
        "type": "git",
        "url": "https://github.com/USERNAME/REPO_NAME.git"
      },
      "bugs": {
        "url": "https://github.com/USERNAME/REPO_NAME/issues"
      },

      "keywords": [
          "foo",
          "bar"
      ],
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
  "dependencies": {
    "react": "^16.1.1"
  },
  "devDependencies": {
    "react-scripts": "^0.6.1"
  }
}
```

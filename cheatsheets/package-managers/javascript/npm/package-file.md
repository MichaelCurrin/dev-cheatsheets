---
description: About the package.json for managing NPM packages
---
# Package file


## Resources

NPM docs:

- [Package.json](https://docs.npmjs.com/files/package.json) doc - includes definitions and examples of fields.
- [Create a package.json file](https://docs.npmjs.com/creating-a-package-json-file) tutorial.


## Base

A `package.json` file, based partially on the default one you get fron `npm init` and accepting defaults. Spaces will be removed by NPM but help here for readability.

**Sample**

The first half of the fields are useful for most projects. 

```json5
{
  "name": "my-package",
  "version": "1.2.3",

  "scripts": {
    // ...
  },

  "dependencies": {
    // ...
  },
  "devDependencies": {
    // ...
  },

  "license": "MIT"
 }
```

Notes:

- The empty are added here for readibility and grouping of related areas - when you do an `npm` command which updates your `package.json` file, all the empty lines will be removed.
- From the docs: "If you don’t plan to publish your package, the name and version fields are optional."
- Optionally include "homepage" with a URL such as GitHub Pages to Netlify URL for the service or docs site.

See my customized [package.json](https://github.com/MichaelCurrin/node-project-template/blob/master/package.json) file in my `node-project-template` repo.


## NPM package

If publishing on NPM, you should probably also set these fields after the ones in the base above. They will show up as metadata in the NPM site UI and also make the package easier to search for.

**Sample**

```json
{ 
  "author": "FIRSTNAME SURNAME <FIRSTNAME.SURNAME@gmail.com> (https://github.com/USERNAME)",

  "displayName": "My Package",
  "description": "My description",

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
  ]
}
```


## Field info
> Tips for using fields and what they mean

See [package.json](https://docs.npmjs.com/cli/v6/configuring-npm/package-json) config guide in the docs.

### Entry point

Setting an entry point only matters if you are distributing your package so that is can be imported as a package.

> The main field is a module ID that is the primary entry point to your program. That is, if your package is named `foo`, and a user installs it, and then does `require("foo")`, then your main module's exports object will be returned.

According to Node [docs](https://nodejs.org/api/packages.html#packages_dual_commonjs_es_module_packages), the `"main"` field is an entry point that is only relevant for CommonJS packages. Example: `"main": "index.js"`.

That field is ignored in ES Modules, which uses something else.

### Scripts

Some suggested script commands.

```json
{
  "scripts": {
    "lint:fix": "",
    "lint:check": "",
    "fmt:fix": "",
    "fmt:check": "",
    "test": "",

    "compile": "",
    "build": "",

    "start": ""
  }
}
```

### Private

The docs say:

> If you set "private": true in your package.json, then npm will refuse to publish it.

But you should just not run `npm publish` I guess. So the note seems silly.

More practically, you can just set this as below if you do not plan to publish to NPM (like a Vue site doesn't make sense as an package for someone to install).

```json
{
  "private": true
}
```

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

### Type

If using ES Modules, set this:

```json
{
  "type": "module"
}
```

Or name your files `.mjs`.

The default is `"commonjs"`.

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

Set a peer dependency.

```json
{
  "peerDependencies": {
  }
}
```

### Engines
> Setting the `engines` field

> Unless the user has set the `engine-strict` config flag, this field is **advisory** only. It will only produce **warnings** when your package is installed as a dependency.

#### Node version

Specify the version of Node that your code works on:


```json
{
  "engines": {
    "node": "VERSION"
  }
}
```

Example values:

- Min `">=16"`
- Min `>=0.10.3`
- Range `">=0.10.3 <15"` - note the space, while Ruby and Python use a comma.
- Compat `~=0.10.3`, or `~=0.10`

#### NPM version

```json
{
  "engines": {
    "npm": "VERSION"
  }
}
```

### License

Even if not using NPM to publish, you'll get a warning if you omit this field so include it.

### Basic

```json
{
  "license":  "MIT"
}
```

### Link

```json
{
  "license": {
    "type": "MIT",
    "url": "http://www.opensource.org/licenses/mit-license.php"
  }
}
```

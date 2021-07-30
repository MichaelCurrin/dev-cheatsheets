# Babel

Use Babel to transpile your TypeScript or JSX to plain JS, or modern JS (e.g. ES6) to older JS (e.g. ES5).

If you want to bundle your scripts and other assets, use [Webpack][], which uses Babel internally.

[Webpack]: {{ site.baseurl }}{% link cheatsheets/javascript/packages/webpack/index.md %}


## Setup

In this example, I have two scripts.

- `src`
    - `es6-lib.js`
    - `hello.js`

## Commands

Set up these commands using NPM scripts or run as `npx babel ...`.

### Basic

Pass a directory or filename.

```sh
$ babel src
```

### Process directory

For every script in `src`, get an output script in `dist`.

```sh
$ babel src --out-dir dist/
```

### Bundle output

Bundle files in `src` and output as a single file. Note that the files are simply concanated. Nothing fancy around functions or namespacing.

```sh
$ babel src --out-file dist/bundle.js
```

Even if you target `src/index.js` and that script imports others, the bundle output will still just be the same as the input file, not including code from the other modules.


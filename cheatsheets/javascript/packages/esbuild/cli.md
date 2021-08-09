---
title: CLI

description: Recommended commands to run for the CLI tool
---

How to minify, bundle, or do both.

You can use the flags in any order, before or after a target path. But for consistency, I've put the path last.


## Output

The basic commands will just print to stdout.

So you need to write to a file using `>`. Or use `--outfile` or `--outdir` flags.


## Basic

If you use no flags, you get the script exactly as is, without pulling in imports or minifying.

```sh
$ esbuild src/index.js
```


## Source map

The `.js.map` file includes content like this:

```
{
  "version": 3,
  "sources": ["../node_modules/lodash/lodash.js", "../src/external-imports.js", "../src/index.js"],
  "sourcesContent": ["/**\n * @license\n * Lodash <https://lodash.com/>\n * Copyright OpenJS Foundation and other contributors <https://openjsf.org/>\n * Released under MIT license <https://lodash.com/license>\n
  ...
```

            
## Bundle

Load an entry-point and pull in dependencies from local imports and external modules.

```sh
$ esbuild --bundle \
    main.js
```

Note `--bundle PATH` is the same as just using `PATH`. 

Example NPM usage from the docs.

You could set this as `build` command in `Makefile` or in `package.json` scripts.

```sh
$ esbuild --bundle \
    --outfile=out.js \
    app.jsx 
```



## Minify

Minify some JS scripts.

```sh
$ esbuild --minify foo.js bar.js
```

Minify an already-bundled JS script. You'll probably want to add `--sourcemap` here plus also when you generate the bundled file.

```sh
$ esbuild --minify --outfile=bundle.min.js bundle.js
```

You could set this as `minify` command in `Makefile` or in `package.json` scripts.

Using `build` directory.

### Without changing directory first

Note `--outfile` does actually need the equals sign.

```sh
$ esbuild \
    --outfile=build/bundle.min.js \
    --minify \
    --sourcemap \
    build/bundle.js 
```

### With changing directory first

Read and write on given paths.

```sh    
$ cd build
$ esbuild --minify --outfile=bundle.min.js bundle.js 
```

Use `stdin` to read and `stdout` to write.

```sh
$ cd build
$ esbuild --minify < bundle.js > bundle.min.js
```


## Bundle and minify

Take multiple JS files into one bundled, minified file.

Based on the CLI help.

```sh
$ esbuild --minify --bundle \
    --sourcemap \
    --outdir=dist \
    main.js
```

That produces:

- `dist/main.js`
- `dist/main.js.map`


## Read

You can omit a target path if you use send text on stdin.

```sh
$ cat build/bundle.js \
  | npx esbuild --minify \
  > build/bundle.min.js
```


## Production build

To avoid errors when using `process.env` in the browser. This is relevant in React.

```sh
--define:'process.env.NODE_ENV="production"'
```

Based on [Getting Started](https://esbuild.github.io/getting-started/) docs which recommend setting a production environment.

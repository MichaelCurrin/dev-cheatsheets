---
title: CLI

description: Recommended commands to run for the CLI tool
---

How to minify, bundle, or do both.

## Output

The commands here just print to stdout, so you need to write to a file or use `--outfile` or `--outdir` flags.


## Basic

If you use no flags, you get the script exactly as is, without pulling in imports or minifying.

```sh
$ esbuild src/index.js
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

Minify an already bundled JS script.

```sh
$ esbuild --minify bundle.js
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
$ cd build && esbuild --minify --outfile=bundle.min.js bundle.js 
```

Use `stdin` to read and `stdout` to write.

```sh
$ cd build && esbuild --minify < bundle.js > bundle.min.js
```

Wrapped on multiple lines.

```sh
$ cat build/bundle.js \
  | npx esbuild --minify \
  > build/bundle.min.js
```


## Bundle and minify

Taking multiple JS files into one bundled, minified file.

From the CLI help.

```sh
$ esbuild --bundle \
    --outdir=dist \
    --minify \ --sourcemap \
     entry_point.js
```

Produces:

- `dist/entry_point.js`
- `dist/entry_point.js.map`

You can easily a TSX file.

```sh
$ esbuild --outfile=dist/main.js src/index.tsx 
```


## Production build

- [Getting Started](https://esbuild.github.io/getting-started/) docs recommend setting a production environment, to avoid errors when using `process.env` in the browser. It says this can happen in React.

```sh
--define:'process.env.NODE_ENV="production"'
```

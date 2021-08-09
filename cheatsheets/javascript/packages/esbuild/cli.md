---
title: CLI

description: Recommended commands to run for the CLI tool
---

## Minify only

To minify an already bundled JS script.

```sh
$ esbuild --minify bundle.js
```

You could set this as `minify` command in `Makefile` or in `package.json` scripts.

Using `build` directory.

### Without changing directory

Note `--outfile` does actually need the equals sign.

```sh
$ esbuild build/bundle.js --outfile=build/bundle.min.js --minify --sourcemap
```

### With changing directory

Read and write on given paths.

```sh    
$ cd build && esbuild --minify bundle.js --outfile=bundle.min.js
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

            
## Bundle only

```sh
$ esbuild --bundle main.js
```

Note `--bundle PATH` is the same as just using `PATH`. And 

Example NPM usage from the docs.

You could set this as `build` command in `Makefile` or in `package.json` scripts.

```sh
$ esbuild app.jsx --bundle --outfile=out.js
```


## Bundle and minify

Taking multiple JS files into one bundled, minified file.

From the CLI help.

```sh
$ esbuild --bundle \
    entry_point.js \
    --outdir=dist \
    --minify --sourcemap
```

Produces:

- `dist/entry_point.js`
- `dist/entry_point.js.map`

You can easily a TSX file.

```sh
$ esbuild src/index.tsx --outfile=dist/main.js
```


## Production build

- [Getting Started](https://esbuild.github.io/getting-started/) docs recommend setting a production environment, to avoid errors when using `process.env` in the browser. It says this can happen in React.

```sh
--define:'process.env.NODE_ENV="production"'
```

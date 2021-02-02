# Bundle

Bundle a TS or JS module as a single JS file.

This includes import modules, both your scripts and external packages.

The output file is an ES module which can be run with Deno, or imported in the browser as a module.

See [bundle](https://deno.land/manual/tools/bundler) manual.


## Usage

```
deno bundle [OPTIONS] SOURCE [DESTIONATION]
```


## Preview bundle

This does not persist - it just prints.

```sh
$ deno bundle index.ts
```


## Write bundle

```sh
$ deno bundle index.ts dist/bundle.js
```

Or if you refer:

```sh
$ deno bundle src/index.ts build/myApp.bundle.ts
```


## Write and watch bundle

Watch for changes continuously using the `--watch` flag.

```sh
$ deno bundle --unstable --watch index.ts dist/bundle.js
```

This is **unstable**. See [issue](https://github.com/denoland/deno/issues/2401#issuecomment-744563503).

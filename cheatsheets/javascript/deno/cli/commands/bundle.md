# bundle


## Usage

```
deno bundle [OPTIONS] SOURCE_FILE [OUT_FILE]
```


## Preview bundle

This does not persist anything - it just prints.

```sh
$ deno bundle index.ts
```


## Write bundle

```sh
$ deno bundle index.ts build/bundle.js
```

Or if you refer:

```sh
$ deno bundle src/index.ts dist/myApp.bundle.ts
```


## Write and watch bundle

Watch for changes continuously using the `--watch` flag.

```sh
$ deno bundle --unstable --watch index.ts dist/bundle.js
```

This is **unstable**. See [issue](https://github.com/denoland/deno/issues/2401#issuecomment-744563503).


## Bundle a URL

The manual says you pass a URL too, if you want to do that for some reason.

```sh
$ deno bundle https://deno.land/std@0.85.0/examples/colors.ts colors.bundle.js
```

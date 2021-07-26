# esbuild

See links to the the ESBuild homepage and links for other bundlers in my [Dev Resources](https://michaelcurrin.github.io/dev-resources/resources/javascript/bundlers.html)


## How to install

Install globally or in your project packages.

```sh
$ npm install esbuild # --global
```

Or invoke with `npx` - which will do a fresh download for you each time. It goes quickly and allows you to leave esbuild out of dev dependencies list.

```sh
$ npx esbuild --help
```

The website also supplies instructions for building from source with Go. 

Or you can download a pre-built binary from NPM. See [Download a build](https://esbuild.github.io/getting-started/#download-a-build). This is useful is you don't have Node installed but still have JS files to process like for a frontend-based focused tool or a Deno app.


## Help

### Overview

Summary of my typical use of this tool:

- I point this a single JS entrypoint of my app. Then all imports (both my own modules and installed modules) will get used in the output.
- I usually use `--minify` as I like the speed and ease of this as a minifier tool.
- If I want to bundle, I'll use `--bundle` flag. For use with Deno, I prefer `deno bundle` (including TS etc. support) and then run `esbuild --minify` on that.
- It's best to always make the [source map][] output file. If you serve this with your app, then it makes debugging easier as your browser will look for the source map - allow you to see what original code looked like.
- If you omit the `--bundle` flag and rather use `--minify` flag and give multiple scripts as paths, then I think you'll created multiple separate minified files. And you can change where they go using `--outdir`.

[source map]: https://developer.mozilla.org/en-US/docs/Tools/Debugger/How_to/Use_a_source_map

### Usage

```
Usage:
  esbuild [options] [entry points]
```

### Flags

Some common flags:

Flag | Description
---  | ---
`--minify` | Minify the output. See [Minifiers][] guide for more info.
`--bundle` | Bundle all dependencies into the output files.
`--sourcemap` | Emit a source map. This will be like `bundle.js.map`.
`--outfile=PATH` | The output file name or path. For one entry-point. Path to write to e.g. `bundle.min.js` or `build/bundle.min.js`.
`--outdir=PATH` | The output directory. For multiple entry points. Directory to write file to e.g. `build`. The filename will be based on the input filename. If you have one entrypoint, this flag is not so useful - rather set `--outfile` and give it a fullpath of directory and filename.

Warnings - you'll get an error if:

- You use a space instead an equals sign.
- You use `outfile` and `outpath` together.
 
[Minifiers]: https://michaelcurrin.github.io/dev-resources/resources/javascript/minifiers.html

Some more flags:

Flag | Description
---  | ---
`--summary`           |  Print some helpful information at the end of a build
`--serve=...`         |  Start a local HTTP server on this host:port for outputs
`--watch`             |  Watch mode: rebuild on file system changes


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


## Use in a script

```javascript
import build from "https://cdn.jsdelivr.net/npm/esbuild";

esbuild.build({
  entryPoints: ['app.jsx'],
  bundle: true,
  outfile: 'out.js',
})
```


## Use with Deno

From the [docs](https://esbuild.github.io/getting-started/#deno).

```typescript
import * as esbuild from 'https://deno.land/x/esbuild@v0.11.17/mod.js'

const ts = 'let test: boolean = true'
const result = await esbuild.transform(ts, { loader: 'ts' })

console.log('result:', result)

esbuild.stop()
```


## Download a build

From [docs](https://esbuild.github.io/getting-started/#download-a-build).

Install binary with curl and unzip it.

```sh
curl -O https://registry.npmjs.org/esbuild-darwin-64/-/esbuild-darwin-64-0.11.17.tgz

tar xf esbuild-darwin-64-0.11.17.tgz

package/bin/esbuild --help
```

# Help

## Usage

```
Usage:
  esbuild [options] [entry points]
```

## Flags

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


## Examples

From the CLI help.

```
# Produces dist/entry_point.js and dist/entry_point.js.map
esbuild --bundle entry_point.js --outdir=dist --minify --sourcemap

# Allow JSX syntax in .js files
esbuild --bundle entry_point.js --outfile=out.js --loader:.js=jsx

# Substitute the identifier RELEASE for the literal true
esbuild example.js --outfile=out.js --define:RELEASE=true

# Provide input via stdin, get output via stdout
esbuild --minify --loader=ts < input.ts > output.js

# Automatically rebuild when input files are changed
esbuild app.ts --bundle --watch

# Start a local HTTP server for everything in "www"
esbuild app.ts --bundle --servedir=www --outdir=www/js
```

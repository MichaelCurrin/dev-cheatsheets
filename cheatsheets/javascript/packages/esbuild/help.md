# Help

## Overview

Summary of my typical use of this tool:

- I point this a single JS entrypoint of my app. Then all imports (both my own modules and installed modules) will get used in the output.
- I usually use `--minify` as I like the speed and ease of this as a minifier tool.
- If I want to bundle, I'll use `--bundle` flag. For use with Deno, I prefer `deno bundle` (including TS etc. support) and then run `esbuild --minify` on that.
- It's best to always make the [source map][] output file. If you serve this with your app, then it makes debugging easier as your browser will look for the source map - allow you to see what original code looked like.
- If you omit the `--bundle` flag and rather use `--minify` flag and give multiple scripts as paths, then I think you'll created multiple separate minified files. And you can change where they go using `--outdir`.

[source map]: https://developer.mozilla.org/en-US/docs/Tools/Debugger/How_to/Use_a_source_map

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


# ES Build

See links to the the ESBuild homepage and links for other [Bundlers][] in my Dev Resources.

[Bundlers]: https://michaelcurrin.github.io/dev-resources/resources/javascript/bundlers.html


### Overview

Summary of my typical use of this tool:

- I point this a single JS entrypoint of my app. Then all imports (both my own modules and installed modules) will get used in the output.
- I usually use `--minify` as I like the speed and ease of this as a minifier tool.
- If I want to bundle, I'll use `--bundle` flag. For use with Deno, I prefer `deno bundle` (including TS etc. support) and then run `esbuild --minify` on that.
- It's best to always make the [source map][] output file. If you serve this with your app, then it makes debugging easier as your browser will look for the source map - allow you to see what original code looked like.
- If you omit the `--bundle` flag and rather use `--minify` flag and give multiple scripts as paths, then I think you'll created multiple separate minified files. And you can change where they go using `--outdir`.

[source map]: https://developer.mozilla.org/en-US/docs/Tools/Debugger/How_to/Use_a_source_map

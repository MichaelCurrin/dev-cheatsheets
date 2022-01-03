# Install

## Install with NPM

Install in your project packages or globally.

```sh
$ npm install esbuild 
$ npm install esbuild --global
```

## Use NPX

Or invoke with `npx` - which will do a fresh download for you each time. It goes quickly and allows you to leave esbuild out of dev dependencies list.

```sh
$ npx esbuild --help
```


## Download a binary

Without using Node or Go (which ES Build it made with), you can download a pre-compiled binary.

You can download a pre-built binary easily from NPM using cURL. This is useful is you don't have Node installed but still have JS files to process like for a frontend-based focused tool or a Deno app.

From [docs](https://esbuild.github.io/getting-started/#download-a-build).

Install binary with `curl` and unzip it:

```sh
$ curl -O https://registry.npmjs.org/esbuild-darwin-64/-/esbuild-darwin-64-0.11.17.tgz
$ tar xf esbuild-darwin-64-0.11.17.tgz
```

Test it:

```sh
$ package/bin/esbuild --help
```

Move it to a bin directory:

```sh
$ mv package/bin/esbuild /usr/local/bin
```

Run from anywhere:

```sh
$ esbuild --help
```


## Build from source 

The website also supplies instructions for building from source with Go. But this is probably only needed if you're developing changes to ES Build or have an unsupported architecture when looking for a downloadable binary file.

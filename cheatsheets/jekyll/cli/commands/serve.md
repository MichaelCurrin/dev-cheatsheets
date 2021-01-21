# Serve


## Run globally

```sh
$ jekyll serve
$ jekyll s
```


## Run with bundler

```sh
$ bundle exec jekyll serve
```


## Examples

### Recommended use

Use verbose error traces (rather than the default very minimal mostly useless errors) and enable hot-reloading of the browser page on changes.

```sh
$ bundle exec  jekyll serve --trace --livereload
```

### Verbose

If you want **very** detailed output to help understand Ruby plugins or Jekyll, then use

```sh
$ jekyll serve --verbose
```

### Incremental

If you want to only rebuild changed pages for a faster build while the server is running.

```sh
$ jekyll serve --incremental
```

I can also recommend Jekyll 4 as it has a build cache which has made rebuilds 60x faster for me. And that was without using the incremental flag and that was actually stopping and starting the server and still getting the benefit of cache.


## Serve a subdirectory

If Jekyll is installed with _Bundler_ at the top-level of the project, you can run Jekyll from anywhere.

```sh
cd sample_site
bundle exec jekyll serve
```

Specify source content in a subdirectory using `--source` flag  and value (which defaults to `./`).

```sh
bundle exec jekyll serve -s sample_site -d sample_site/_site
```

Still builds to top-level `_site`, so destination is set here too. Note that when running a local server, it doesn't actually matter where `_site` is as long it is not versioned.

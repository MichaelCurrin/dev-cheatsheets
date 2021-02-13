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


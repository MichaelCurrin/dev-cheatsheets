---
description: Using `jekyll` CLI commands
---
# Commands


## Flags

CLI flags of interest to me for `serve` and `build`.

Debugging serve or build:

- `--trace` - Show error details.
`-V, --verbose`
- `--profile`

General use:

- `-q, --quiet`
- `-b, --baseurl URL`
- `--config CONFIG_FILE[,CONFIG_FILE2,...]`

Serve flags:

- `-l, --livereload`
- `-I, --incremental`
- `-H` e.g. `--host 0.0.0.0` Open up to requests on the network.


## Serve

### Run globally

```sh
$ jekyll serve
$ jekyll s
```

### Run with bundler

```sh
$ bundle exec jekyll serve
```

### Help

Note some repetition here because `jekyll` help is added to `jekyll serve` help output.

```
jekyll serve -- Serve your site locally

Usage:

  jekyll serve [options]

Options:
            --config CONFIG_FILE[,CONFIG_FILE2,...]  Custom configuration file
        -d, --destination DESTINATION  The current folder will be generated into DESTINATION
        -s, --source SOURCE  Custom source directory
            --future       Publishes posts with a future date
            --limit_posts MAX_POSTS  Limits the number of posts to parse and publish
        -w, --[no-]watch   Watch for changes and rebuild
        -b, --baseurl URL  Serve the website from the given base URL
            --force_polling  Force watch to use polling
            --lsi          Use LSI for improved related posts
        -D, --drafts       Render posts in the _drafts folder
            --unpublished  Render posts that were marked as unpublished
            --disable-disk-cache  Disable caching to disk in non-safe mode
        -q, --quiet        Silence output.
        -V, --verbose      Print verbose output.
        -I, --incremental  Enable incremental rebuild.
            --strict_front_matter  Fail if errors are present in front matter
            --ssl-cert [CERT]  X.509 (SSL) certificate.
        -H, --host [HOST]  Host to bind to
        -o, --open-url     Launch your site in a browser
        -B, --detach       Run the server in the background
            --ssl-key [KEY]  X.509 (SSL) Private Key.
        -P, --port [PORT]  Port to listen on
            --show-dir-listing  Show a directory listing instead of loading your index file.
            --skip-initial-build  Skips the initial site build which occurs before the server is started.
        -l, --livereload   Use LiveReload to automatically refresh browsers
            --livereload-ignore ignore GLOB1[,GLOB2[,...]]  Files for LiveReload to ignore. Remember to quote the values so your shell won't expand them
            --livereload-min-delay [SECONDS]  Minimum reload delay
            --livereload-max-delay [SECONDS]  Maximum reload delay
            --livereload-port [PORT]  Port for LiveReload to listen on
```
```
        -s, --source [DIR]  Source directory (defaults to ./)
        -d, --destination [DIR]  Destination directory (defaults to ./_site)
            --safe         Safe mode (defaults to false)
        -p, --plugins PLUGINS_DIR1[,PLUGINS_DIR2[,...]]  Plugins directory (defaults to ./_plugins)
            --layouts DIR  Layouts directory (defaults to ./_layouts)
            --profile      Generate a Liquid rendering profile
        -h, --help         Show this message
        -v, --version      Print the name and version
        -t, --trace        Show the full backtrace when an error occurs
```


## Build

```sh
$ jekyll build
```

### Help

```
jekyll build -- Build your site

Usage:

  jekyll build [options]

Options:
            --config CONFIG_FILE[,CONFIG_FILE2,...]  Custom configuration file
        -d, --destination DESTINATION  The current folder will be generated into DESTINATION
        -s, --source SOURCE  Custom source directory
            --future       Publishes posts with a future date
            --limit_posts MAX_POSTS  Limits the number of posts to parse and publish
        -w, --[no-]watch   Watch for changes and rebuild
        -b, --baseurl URL  Serve the website from the given base URL
            --force_polling  Force watch to use polling
            --lsi          Use LSI for improved related posts
        -D, --drafts       Render posts in the _drafts folder
            --unpublished  Render posts that were marked as unpublished
            --disable-disk-cache  Disable caching to disk in non-safe mode
        -q, --quiet        Silence output.
        -V, --verbose      Print verbose output.
        -I, --incremental  Enable incremental rebuild.
            --strict_front_matter  Fail if errors are present in front matter
```
```
        -s, --source [DIR]  Source directory (defaults to ./)
        -d, --destination [DIR]  Destination directory (defaults to ./_site)
            --safe         Safe mode (defaults to false)
        -p, --plugins PLUGINS_DIR1[,PLUGINS_DIR2[,...]]  Plugins directory (defaults to ./_plugins)
            --layouts DIR  Layouts directory (defaults to ./_layouts)
            --profile      Generate a Liquid rendering profile
```


## Jekyll commands

### Help

```sh
$ bundle exec jekyll -h
```

```
jekyll 4.1.1 -- Jekyll is a blog-aware, static site generator in Ruby

Usage:

  jekyll <subcommand> [options]

Options:
        -s, --source [DIR]  Source directory (defaults to ./)
        -d, --destination [DIR]  Destination directory (defaults to ./_site)
            --safe         Safe mode (defaults to false)
        -p, --plugins PLUGINS_DIR1[,PLUGINS_DIR2[,...]]  Plugins directory (defaults to ./_plugins)
            --layouts DIR  Layouts directory (defaults to ./_layouts)
            --profile      Generate a Liquid rendering profile
        -h, --help         Show this message
        -v, --version      Print the name and version
        -t, --trace        Show the full backtrace when an error occurs

Subcommands:
  compose
  docs
  import
  build, b              Build your site
  clean                 Clean the site (removes site output and metadata file) without building.
  doctor, hyde          Search site and print specific deprecation warnings
  help                  Show the help message, optionally for a given subcommand.
  new                   Creates a new Jekyll site scaffold in PATH
  new-theme             Creates a new Jekyll theme scaffold
  serve, server, s      Serve your site locally
```

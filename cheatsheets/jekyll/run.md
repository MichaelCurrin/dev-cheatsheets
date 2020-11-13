# Run


## Help

For help see:

```sh
jekyll --version
jekyll help serve
jekyll serve --help
# Find config issues.
jekyll doctor
```



## Serve subdirectory

If Jekyll is installed with *Bundler* at the top-level of the project, you can run Jekyll from anywhere.

```sh
cd sample_site
bundle exec jekyll serve
```

Specify source content in a subdirectory using `--source` flag  and value (which defaults to `./`).

```sh
bundle exec jekyll serve -s sample_site -d sample_site/_site
```

Still builds to top-level `_site`, so destination is set here too. Note that when running a local server, it doesn't actually matter where `_site` is as long it is not versioned.


## Testing

If you want to test a snippet or part of another site in your own, create a subdirectory. You can use the gems from the top-level directory.
```
_site
test_site/ # Sub directory project
  _site
  index.md
  _config.yml
Gemfile
index.md
_config.yml
```

```sh
cd test_site
bundle exec jekyll serve
```

## Flags

For `jekyll serve [options]`


### Debug flags

| Flag        | Description                                                                                                                         |
| ----------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `--verbose` | Increase message logged in the console.                                                                                             |
| `--debug`   | Show details about an error if there is one. Errors are very quiet so it is useful to always run this especially for remote builds. |
| `--trace`   | Show the full backtrace when an error occurs.                                                                                       |

### Loading flags

| Flag                 | Description                                                                                                                 |
| -------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `--show-dir-listing` | Show contents of the directory. Ignores an existing `index.html`. This flag is not needed if there is no `index.html` file. |
| `-l, --livereload`   | Use LiveReload to automatically refresh browsers                                                                            |
| --no-watch           | Disabling the default option to watch for changes and rebuild.                                                              |

### Show and hide content

| Flag                      | Description                                     |
| ------------------------- | ----------------------------------------------- |
| `-D, --drafts`            | Render posts in the _drafts folder              |
| `--unpublished `          | Render posts that were marked as unpublished    |
| `--future`                | Publishes posts with a future date              |
| `--limit_posts MAX_POSTS` | Limits the number of posts to parse and publish |

### Configuration

| Flag                                     | Description   |
| ---------------------------------------- | ------------- |
| `--config CONFIG_FILE,[CONFIG_FILE,...]` | Read configs. |
`-d, --destination DESTINATION`  The current folder will be generated into DESTINATION
`-s, --source SOURCE` |  Custom source directory
`-b, --baseurl URL` |  Serve the website from the given base URL
`--layouts DIR` |  Layouts directory (defaults to ./_layouts)

### Full

Copied from the command-line for Jekyll 4:

```
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
        -h, --help         Show this message
        -v, --version      Print the name and version
        -t, --trace        Show the full backtrace when an error occurs
```

These also appear in the output and are repeated for every command - they can be seen alone with `jekyll help`.

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

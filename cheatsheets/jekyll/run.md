# Jekyll run cheatsheet


## Help

For help see:

```
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

Flag | Description
--- | ---
`--verbose` | Increase message logged in the console.
`--debug` | Show details about an error if there is one. Errors are very quiet so it is useful to always run this especially for remote builds.
--trace` | Show the full backtrace when an error occurs.

### Loading flags

Flag | Description
--- | ---
`--show-dir-listing` | Show contents of the directory. Ignores an existing `index.html`.
`-l, --livereload` | Use LiveReload to automatically refresh browsers
--no-watch | Disabling the default option to watch for changes and rebuild.

### Show and hide content

Flag | Description
--- | ---
`-D, --drafts` | Render posts in the _drafts folder
`--unpublished ` | Render posts that were marked as unpublished
`--future`  |  Publishes posts with a future date
`--limit_posts MAX_POSTS` | Limits the number of posts to parse and publish

### Configuration

Flag | Description
--- | ---
`--config CONFIG_FILE,[CONFIG_FILE,...]` | Read configs.
`-d, --destination DESTINATION`  The current folder will be generated into DESTINATION
`-s, --source SOURCE` |  Custom source directory
`-b, --baseurl URL` |  Serve the website from the given base URL
`--layouts DIR` |  Layouts directory (defaults to ./_layouts)
      
### Full
  
Copied from the command-line for Jekyll 4:

Yes some are repeated.

```
ll-plugins
drwxr-xr-x  23 mcurrin  151928526   736B  2 Jan 16:38 knitting-against-nuclear
drwxr-xr-x   2 mcurrin  151928526    64B  3 Dec 19:15 measure-sa
drwxrwxr-x@  9 mcurrin  151928526   288B 10 May 21:19 mkdocs-poetry
drwxr-xr-x  31 mcurrin  151928526   992B 11 Apr 20:22 my-github-projects
drwxr-xr-x   6 mcurrin  151928526   192B 15 May 21:01 nested-jekyll-menus
drwxr-xr-x  11 mcurrin  151928526   352B  3 Feb 09:48 netflix-assistant
drwxr-xr-x  20 mcurrin  151928526   640B  3 Dec 16:12 open-air
drwxr-xr-x   9 mcurrin  151928526   288B 14 Apr 22:49 python-twitter-guide
drwxr-xr-x   9 mcurrin  151928526   288B 30 Jan 19:38 repo-boilerplates
drwxr-xr-x  24 mcurrin  151928526   768B  6 Apr 22:37 second-liners-improv
drwxr-xr-x   7 mcurrin  151928526   224B 19 Feb 09:54 social-maths-calculator
drwxr-xr-x  27 mcurrin  151928526   864B  3 Feb 09:57 static-pages-demo
drwxr-xr-x  17 mcurrin  151928526   544B 26 Jan 09:34 static-site-api-request-demo
drwxr-xr-x   7 mcurrin  151928526   224B 27 Mar 09:47 static-sites-generator-resources
drwxr-xr-x  32 mcurrin  151928526   1.0K 16 May 22:42 the-buckfever-underground
drwxr-xr-x  24 mcurrin  151928526   768B  3 Feb 10:17 the-second-liners-hugo-site
drwxr-xr-x  22 mcurrin  151928526   704B 11 Feb 14:24 trends
➜  static-sites
➜  static-sites
➜  static-sites cd jekyll-actions-quickstart
➜  jekyll-actions-quickstart git:(master) j -v
jekyll 4.0.0
➜  jekyll-actions-quickstart git:(master) j serve --version
serve
➜  jekyll-actions-quickstart git:(master) j serve -h
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
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTA2MjkzMjYzM119
-->
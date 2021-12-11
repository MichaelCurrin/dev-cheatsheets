# CLI

## Resources

- [Commands](https://gohugo.io/commands/) in Hugo docs.



## Start dev server 

```sh
$ hugo server
```

## Build 

```sh
$ hugo
```

Recommended in the Hugo docs for a deploy:

```sh
$ hugo --gc --minify
```

- `--minify` minify any supported output format (HTML, XML etc.)
- `--gc` enable to run some cleanup tasks (remove unused cache files) after the build

Debug with:

- `v, --verbose` verbose output
- `--verboseLog` verbose logging


## Import Jekyll

From [doc](https://gohugo.io/commands/hugo_import_jekyll/).

```sh
$ hugo import jekyll JEKYLL_ROOT OUT_PATH
```

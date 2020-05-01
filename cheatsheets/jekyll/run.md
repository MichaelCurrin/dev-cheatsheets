# Jekyll run cheatsheet

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

Useful for build or serve. Gem errors can be too silent so for remote and local builds you can keek debug on.

```sh
--verbose

--debug
```

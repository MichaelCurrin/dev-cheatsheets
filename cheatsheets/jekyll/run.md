# Jekyll run cheatsheet

## Serve subdirectory

If Jekyll is installed with Bundler at the top-level of the project, you can run Jekyll from anywhere.

```sh
cd sample_site
bundle exec jekyll serve
```

Or simply from the root:

```sh
bundle exec jekyll serve
```


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

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTU2NjE5MDI0XX0=
-->
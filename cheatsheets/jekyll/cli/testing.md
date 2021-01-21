# Testing

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

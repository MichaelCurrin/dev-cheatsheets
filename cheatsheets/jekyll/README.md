# Jekyll cheatsheets

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


## External cheatsheets

- [Jekyll cheatsheet](https://learn.cloudcannon.com/jekyll-cheat-sheet/) on CloudCannon.
- [Jekyll cheatsheet](https://devhints.io/jekyll) on DevHints.
 

## Learn Jekyll

For a guide on getting start with or using Jekyll, see [Jekyll](https://github.com/MichaelCurrin/static-sites-generator-resources/blob/master/Jekyll/) guide in _MichaelCurrin/static-sites-generator-resources_ repo.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE1NjUxMjA5MjRdfQ==
-->
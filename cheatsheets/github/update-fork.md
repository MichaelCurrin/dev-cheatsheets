# Update fork

## Browser

Add changes from upstream original repo into your fork.

If you see your `master` is out of date with the fork, click Pull Request on the repo view.

That will merge your fork into the original, so click "switch base" to flip then.

Or do by URL.

e.g. Merging from repo owned by `helaili` into my own.

```
https://github.com/MichaelCurrin/jekyll-action/compare/master...helaili:master
```

Then merge with a rebase merge, to avoid creating a merge commit in your fork.

**Note: I tried this approach and did and added commits unexpectedly on my fork.**


## Command-line

```sh
$ git checkout master
$ git pull upstream master
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEyNTA5ODYyNDZdfQ==
-->
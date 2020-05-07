# Github cheatsheet

## Update fork

### Browser

Add changes from upstream original repo into your fork.

If you see your `master` is out of date with the fork, click Pull Request on the repo view.

That will merge your fork into the original, so click "switch base" to flip then.

Or do by URL

e.g. Merging from repo owned by `helaili` into my own.

```
https://github.com/MichaelCurrin/jekyll-action/compare/master...helaili:master
```

Then merge with a rebase merge, to avoid creating a merge commit in your fork.


### Command-line

```sh
$ git checkout master
$ git pull upstream master
```

## Pull request templates

[Tutorial](https://help.github.com/en/github/building-a-strong-community/creating-a-pull-request-template-for-your-repository)

```
pull_request_template.md

docs/pull_request_template.md

.github/pull_request_template.md
```

> In the body of the new file, add your pull request template. This could include:
> -A reference to a related issue in your repository.
> - A description of the changes proposed in the pull request.
> - @mentions of the person or team responsible for reviewing proposed changes.

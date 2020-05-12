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


## Repo links

Without loading just the README, you can focus on it.


```markdown
The NPM package.json actually uses this.
[link](https://github.com/MichaelCurrin/cheatsheets#readme)

Or the heading even.

[link](https://github.com/MichaelCurrin/cheatsheets#cheatsheets)
```

Contrast with:

```markdown
[link](https://github.com/MichaelCurrin/cheatsheets/blob/master/README.md)
```

## Security and automation


## Personal access tokens

aka "PAT"

> Tokens you have generated that can be used to access the GitHub API.
> 
> Make sure to copy your new personal access token now. You won’t be able to see it again! 

If you have one token across repos, then if need to regenerate, then you'd have to go and update everywhere. 

So you might want to create a PAT for each application as a one to one mapping. 

### Secrets

> Secrets
> Secrets are environment variables that are **encrypted** and only exposed to selected actions. Anyone with **collaborator** access to this repository can use these secrets in a workflow.
> 
> Secrets are not passed to workflows that are triggered by a pull request from a fork
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTc2NTU3NTc4MiwtMTk1Mjc5ODc2N119
-->
# Github actions cheatsheet

## Resources

- [Configuring and managing workflows](https://help.github.com/en/actions/configuring-and-managing-workflows/configuring-a-workflow) from actions docs
- [Syntax](https://help.github.com/en/actions/reference/workflow-syntax-for-github-actions)
- [Github Actions Documentation](https://help.github.com/en/actions)
- [Github Actions](https://github.com/actions) org on Github
- [Github Actions](https://github.community/t5/GitHub-Actions/bd-p/actions) community forums


## Examples

### Python

Build to a matrix of Python versions.

```yaml
name: Python package

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
      max-parallel: 4
      matrix:
        python-version: [3.6, 3.X]

    steps:
      - uses: actions/checkout@v1
      - name: Set up Python ${{ matrix.python-version }}
        uses: actions/setup-python@v1
        with:
          python-version: ${{ matrix.python-version }}
      - name: Install dependencies
        run: make dev-install
      - name: Check formatting.
        run: make format
      - name: Lint with Pylint.
        run: make lint
```

## Run conditions

### On push vs Pull Request

Applies to pushes on master and branches, even if no PR.

```yaml
on: push
```

This comes from the docs but doesn't seem to add much from above.

```yaml
on: [push, pull_request]
```

Or trigger on Pull Request only. 

```yaml
on: pull_request
```
This is useful if you enforce checks passing in repo branch rules, which also means that PRs are needed and commits cannot be made to master directly.

This could be useful to avoid doing a check when pushing to a feature branch without a Pull Request. Assuming that is will rerun checks on pushes to the PR - to be confirmed.

### Branches

You may want to restrict your action to only build on  pushes `master` and not feature branches. For example if the Action writes over content in `gh-pages` branch.

```yaml
on:
  push:
    branches:    
      - master
```

## Scheduling

Schedule a nightly build such as of a Github Page site.

Note that `*` is a special character in YAML so you have to quote this string.

```yaml
on:
  schedule:
    - cron:  '*/15 * * * *'
```

[On schedule](https://help.github.com/en/actions/reference/workflow-syntax-for-github-actions#onschedule)


## Limitations


[Intro to Github Actions blog post](https://gabrieltanner.org/blog/an-introduction-to-github-actions)

> Actions are completely free for every open-source repository and include **2000 free build minutes per month** for all your private repositories which is comparable with most CI/CD free plans. If that is not enough for your needs you can pick another plan or go the self-hosted route.
<!--stackedit_data:
eyJoaXN0b3J5IjpbMzU0OTQzOTE3XX0=
-->
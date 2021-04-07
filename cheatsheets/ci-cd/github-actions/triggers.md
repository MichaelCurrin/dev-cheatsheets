---
description: Choose events that trigger your workflow 
---
# Triggers

{% raw %}

Here we use the `on` field and one or more events to trigger a workflow.

See the docs - [Events that trigger workflows](https://docs.github.com/en/actions/reference/events-that-trigger-workflows).

Note - in general if you have test, lint and build steps, you probably want to run them on all pushes and PRs. If there is anything related to a deploy, you probably only want to run against the master branch. Also you will only want to run the deploy against `master` - if you run it against both `master` and `gh-pages`, you'll have issues.


## Trigger on a commit

### On push to any branch

This will build on master and any feature branch, even without a PR.

```yaml
on: push
```

### On pull request

Trigger only with pull requests. See [docs](https://docs.github.com/en/actions/reference/events-that-trigger-workflows#pull_request).

This will build on a feature branch if it has PR. 

#### Commits

This triggers **every time** you you push a commit to the feature branch or edit it on GitHub UI.

```yaml
on: pull_request
```

```yaml
on:
    pull_request:
```

Limit to Pull Requests which target `master`. This is safer, as you avoid triggering on PRs between feature branches.

```yaml
on:
  pull_request:
    branches: master
```

#### PR events

Available event types are listed in the doc linked above.

> Note: By default, a workflow only runs when a pull_request's activity type is `opened`, `synchronize`, or `reopened`. To trigger workflows for more activity types, use the types keyword.

Add a trigger for when a PR is assigned.

```yaml
on:
  pull_request:
    types: [assigned, opened, synchronize, reopened]
```

Limit to when a PR against master is merged. There is no `merged` so use `closed`. This closed event I think might be triggered when you close without merging.

This is similar to listening to `push` event on `master`, but it requires a PR to exist and does not pick up on just any commit to `master`.

```yaml
on:
  pull_request:
    branches: master
    types: closed
```

### On push or Pull Request to any branch

```yaml
on: [push, pull_request]
```

Or

```yaml
on:
  - push
  - pull_request
```

Or

```yaml
on:
  push:
  pull_request:
```

### On push to master or Pull Request to master

This won't run on a PR between two branches which aren't the `master` branch.

```yaml
on:
  push:
    branches: master
  pull_request:
    branches: master
```

Or more verbose:

```yaml
on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]
```

Or

```yaml
on:
  push:
    branches: 
      - master
  pull_request:
    branches: 
      - master
```


## Trigger on a schedule

Using [on.schedule](https://help.github.com/en/actions/reference/workflow-syntax-for-github-actions#onschedule) parameter.

Check syntax using [crontab.guru](https://crontab.guru/) site.

Example:

```yaml
on:
  schedule:
    - cron:  '0 0 * * *'
```


## Include or ignore

### Ignore a branch or tag

Note that if you use a rule from another section to include pushes to master and PRs to master, you won't have to ignore automated commits to `gh-pages`.

[docs](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#example-ignoring-branches-and-tags)

```yaml
on:
  push:
    branches-ignore:
      - foo
```

### Ignore path

Trigger on any path **except** the ignored paths.

```yaml
on:
  push:
    paths-ignore:
      - "dir-name/**"
      - "file.txt"
```

Or maybe just `dir0name` without the stars?

### Include path

Trigger **only** on changes in given paths. Note you don't need `**`. This will already work nested.

Examples:

```yaml
on:
  push:
    paths:
      - "*.js"
      - "*.css"
```

```yaml
on:
  push:
    paths:
      - src
```

### Ignore markdown changes

Triggered on a commit or push to your main branch or any branch with a Pull Request. Ignore changes to markdown files at all levels (such as `README.md` and in `docs`).
 
- `main.yml` 
    ```yaml
    on:
      push:
        branches: main
        paths-ignore:
          - "*.md"

      pull_request:
        branches: main
        paths-ignore:
          - "*.md"
    ```

### Ignore doc changes

More explicit - trigger on markdown changes but not doc-related changes. 

Similar to above but still watches for changes in markdown files outside the docs directory. Such as if you have a static site with markdown content in the root of the repo.

- `main.yml` 
    ```yaml
    on:
      push:
        branches: main
        paths-ignore:
          - "docs/**"
          - README.md

      pull_request:
        branches: main
        paths-ignore:
          - "docs/**"
          - README.md
    ```


## Trigger on tag

Specify a tag rule under `on.push.tags`. 

Use a regex pattern - this must be set.

```yaml
on:
  push:
    tags:
      - 'v*'
```

You can make a advanced rule that only triggers on `v1` and up or excludes `-alpha` releases, if that matters to you.

You can add `branches` rules - if for some reason you are making a tag that is _not_ your on main branch and you don't want that to trigger your workflow.

```yaml
on:
  push:
    tags: 
    branches: [ main ]
```

You can also use a conditional statement on a step.

```yaml
if: startsWith(github.ref, 'refs/tags/')
```

There is no `on.tag` or `on.tags` option, but there is `on.release` - see below.


## Trigger on a release

Trigger your workflow when you create a release under Releases section of your repo - note that a release is not the same as a tag.

From the docs:

> Note: The release event is not triggered for draft releases.

So presumably it is safe to use `created`. Perhaps that only runs once, while a release could be published, unpublished and published (I've seen a release unpublished, i.e. moved to drafts, by deleting its tag).

```yaml
on:
  release:
    types: created
```

Here is one I found which covers more events.

```yaml
on:
  release:
    types: [published, created, edited]
```

Types available:

- `published`
- `unpublished`
- `created`
- `edited`
- `deleted`
- `prereleased`
- `released`


## Trigger on a GH Pages build

```yaml
on:
 page_build:
```

Note that even if you use GA to build your static site to the `gh-pages` branch, if GH Pages is enabled then GH will also do an additional build of that branch. But since it just contains assets and HTML and no Jekyll config, the build will be super simple. This flow of Jekyll doing two builds is seamless and so you won't even notice it but the point here is that the page build trigger can still be useful.


## Multiple triggers in one workflow

Add multiple triggers. Here we run on push to master, PR to master and on a nightly cron job.

```yaml
on:
  push:
    branches:
      - master

  pull_request:
    branches:
      - master

  schedule:
    - cron:  '0 0 * * *'
```

Depending on how you set up the jobs section, you can have them depend on each other or run in parallel.


You can add "checks" in your branch rules so that a PR can _only_ merge to master after all checks pass


## Multiple workflow files

You might split out to two workflow files such as one with a push trigger and app testing job and another with a release trigger and page build job, as below.
To only build the site when creating a tag. This means you build less frequently but more _safely_ and deliberately from a tag. This is especially useful if there are multiple people working on your project and comitting merging to master.

```yaml
# build.yml
on:
  push:
    branches:
      - master

  pull_request:
    branches:
      - master

jobs:
  build:
    # Installs

    # Linting and unit tests.

    # Build the app or static site so any errors come up, but don't persist the result.
```

```yaml
# deploy.yml
release:
    types:
      - created

jobs:
  deploy:
    # Build static site or docs site or publish to NPM etc.
```


## Manual triggers

See [Manual events](https://docs.github.com/en/free-pro-team@latest/actions/reference/events-that-trigger-workflows#manual-events) in the docs.

There are two formats available.

### Workflow dispatch

Trigger a workflow on a button click.

> To trigger specific workflows in a repository, use the `workflow_dispatch event`.

If you setup this option, then you'll get a button on the Actions tab to click and so run the workflow directly. Without a commit needed and without having to wait for a cron trigger.

You can even specify text **inputs** so that you get prompted to fill those in and have them used in the job.

Syntax:

```yaml
on: workflow_dispatch
```

Or

```yaml
on:
  workflow_dispatch:
    inputs:
      my-title:
        description: # ...
        required: # true or false
        default: # ...
      
      # ...
```

The default is the value that is shown in the pop-up.

Basic trigger and job example:

```yaml
name: Manually triggered workflow

on:
  workflow_dispatch:
    inputs:
      name:
        description: 'Person to greet'
        required: true
        default: 'Mona the Octocat'

      home:
        description: 'location'
        required: false
        default: 'The Octoverse'

jobs:
  say-hello:
    runs-on: ubuntu-latest

    steps:
      - run: |
        echo "Hello, ${{ github.event.inputs.name }}!"
        echo "- in ${{ github.event.inputs.home }}!"
```

An example suggested by GH Actions, when making new workflow file. 

```yaml
name: Manual workflow

on:
  workflow_dispatch:
    inputs:
      name:
        # Friendly description to show in the UI instead of 'name'
        description: 'Person to greet'
        required: true
        default: 'World'

jobs:
  greet:
    runs-on: ubuntu-latest

    steps:
      - name: Send greeting
        run: echo "Hello ${{ github.event.inputs.name }}"
```


### Repo dispatch

> To trigger more than one workflow in a repository and create custom events and event types, use the `repository_dispatch` event.

```yaml
on:
  repository_dispatch:
    types: [opened, deleted]
```

{% endraw %}

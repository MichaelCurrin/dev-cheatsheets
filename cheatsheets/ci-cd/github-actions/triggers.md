---
title: Triggers
description: Choose and configure events to trigger your GitHub Actions workflow
---

{% raw %}

To set up a trigger for an event, we use the `on` field and one or more events.

See also GitHub's docs - [Events that trigger workflows](https://docs.github.com/en/actions/reference/events-that-trigger-workflows).


## Ordinary commits vs releases

Some advice:

- In general, if you have test, lint, and build steps, you will probably want to run them _everytime_. i.e. On all pushes to the main branch and on all PRs. 
- If there is anything related to a _deploy_ (like building a site) or a release (like bundling and uploading a JS/Python/Ruby package), you probably only want to run against the _main_ branch (for production) and no other branches (as those are for development). And you could even restrict to only run against a _tag_ or _release_ created on the main branch, and not just any commit to the main branch.


## Trigger on a commit

### On push to any branch

This will build on the main branch and _any_ feature branch, even without a PR.

```yaml
on: push
```

### On pull request

Trigger only with pull requests. See [docs](https://docs.github.com/en/actions/reference/events-that-trigger-workflows#pull_request).

This will build on a feature branch, only if it has PR. So this gives more control, so you if a branch is work-in-progress and not ready for a PR, no runs happen.

#### Commits

This triggers **every time** you either push a commit to the feature branch or edit it on GitHub UI.

```yaml
on: pull_request
```

```yaml
on:
    pull_request:
```

Limit to Pull Requests which target `main` branch. This is safer and recommended, as you avoid triggering on PRs _between_ feature branches other than the main one (in case you ever do that in a minority of cases).

```yaml
on:
  pull_request:
    branches: main
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

Restrict to when a PR against the main branch is merged. There is no `merged` option, so use `closed`. This closed event I think might be triggered when you close without merging.

This is similar to listening to `push` event on `master`, but it requires a PR to exist and does not pick up on just any commit to `master`.

```yaml
on:
  pull_request:
    branches: main
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

### On push to main or Pull Request to main

Runs on a PR again main but won't run on a PR between two branches that both aren't the _main_ branch.

```yaml
on:
  push:
    branches: main
    
  pull_request:
    branches: main
```

Or, more verbose:

```yaml
on:
  push:
    branches: [ main ]
    
  pull_request:
    branches: [ main ]
```

Or

```yaml
on:
  push:
    branches:
      - main
      
  pull_request:
    branches:
      - main
```


## Trigger on a schedule

Use the [on.schedule](https://help.github.com/en/actions/reference/workflow-syntax-for-github-actions#onschedule) parameter.

Check your syntax using [crontab.guru](https://crontab.guru/) site.

Here with a sample value to run at midnight daily.

```yaml
on:
  schedule:
    - cron:  "0 0 * * *"
```

Be sure to **quote** the value, in to prevent YAML expansion of globstars which would cause an error.


## Include or ignore

From [On push pull request paths](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#onpushpull_requestpaths) in the docs.

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

Trigger **only** on changes in given paths. Note you don't need `**` - a single `*` is enough to work at multiple levels.

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
    branches: [ main ]
    tags:
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
      - main

  pull_request:
    branches:
      - main

  schedule:
    - cron:  "0 0 * * *"
```

Depending on how you set up the jobs section, you can have them depend on each other or run in parallel.


You can add "checks" in your branch rules so that a PR can _only_ merge to master after all checks pass


## Multiple workflow files

You might split out to two workflow files such as one with a push trigger and app testing job and another with a release trigger and page build job, as below.
To only build the site when creating a tag. This means you build less frequently but more _safely_ and deliberately from a tag. This is especially useful if there are multiple people working on your project and comitting merging to master.

- `build.yml`
    ```yaml
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
- `deploy.yml`
    ```yaml
    release:
        types:
          - created

    jobs:
      deploy:
        # Build static site or docs site or publish to NPM etc.
        # ...
    ```


## Manual triggers

See [Manual events](https://docs.github.com/en/free-pro-team@latest/actions/reference/events-that-trigger-workflows#manual-events) in the docs.

There are two formats available.

### Workflow dispatch

Trigger a workflow on a button click.

> To trigger specific workflows in a repository, use the `workflow_dispatch event`.

If you set up this option, then you'll get a button on the Actions tab to click and so run the workflow directly. Without a commit needed and without having to wait for a cron trigger.

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

- `main.yml`
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

- `main.yml`
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

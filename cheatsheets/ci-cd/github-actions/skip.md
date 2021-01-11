---
description: How to skip some or all of the build steps
---
# Skip

{% raw %}

## Ignore paths

Don't run the workflow if changes were only made to certain paths, such as the `docs` directory.

Remember to use quotes so stop YAML evaluation of the `**` glob.

### Paths ignore attribute

Use `paths-ignore` attribute.

From [example ignoring paths](https://docs.github.com/en/free-pro-team@latest/actions/reference/workflow-syntax-for-github-actions#example-ignoring-paths) in the docs.

```yaml
on:
  push:
    paths-ignore:
      - "docs/**"
```

If your docs directory has a lot of files in it that you edit often, then it is worth skipping that at least.

You don't have to be thorough. Like I wouldn't put your `LICENSE` file in there as that hardly changes.

### Paths attribute

This will only build `.js` files and ignore others.

```yaml
on:
  push:
    paths:
    - "**.js"
```

This is dangerous because you might leave your workflow file, `Makefile`, package files, etc. So can avoid being too restrictive accidentally by using the exclusion in the previous section instead.

### Positive and negative paths

Or using a `!` symbol in the `paths` attribute. The order matters. Here we include a directory and then exclude a subdirectory.

```yaml
on:
  push:
    paths:
      - "sub-project/**"
      - "!sub-project/docs/**"
```


## Skip a step

### Event type

Here we run the workflow on both a Push and a Pull Request, but we only perform the deploy step when the event is **not** a pull request i.e. when doing a push to `master` (or `main` or `latest` etc.). 

```yaml
on:
  push:
  pull_request:

jobs:
  build_and_deploy:
    steps:
      - name: Build

      - name: Deploy
        if: ${{ github.event_name != 'pull_request' }}
```

Note we don't have to specify a branch name. 

You might like using `!= 'pull_request'` as it is flexible - it will include a scheduled cron event. Or you might make this narrower as `== 'push'`.

### Commit message

Add a condition to skip if the commit message containts a phrase - here we use `[ci skip]`.

```yaml
jobs:
  deploy_docs:
    if: "!contains(github.event.commits[0].message, '[ci skip]')"

    steps:
      # ...
```

In general I like to use an exclusion rule to exclude changes in `docs/` for example from causing an app rebuild. I don't why you would this CI skip example above as you have to remember to use. But I found it somewhere so added here.

{% endraw %}

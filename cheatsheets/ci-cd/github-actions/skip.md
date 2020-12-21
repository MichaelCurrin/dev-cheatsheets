# Skip
> How to skip some or all of the build steps

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


## Skip step

Add a condition to skip if the commit message containts the phrase `[ci skip]`.

```yaml
jobs:
  deploy_docs:
    if: "!contains(github.event.commits[0].message, '[ci skip]')"

    steps:
      # ...
```

{% endraw %}

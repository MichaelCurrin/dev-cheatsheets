# Working directory

If you need to have all job commands start in a target directory.

This is useful for example if you are build a docs site where all the code is in `docs` directory.

See [defaults.run](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#defaultsrun) in the Workflow Syntax docs.

```yaml
defaults:
  run:
    working-directory: docs

jobs:
  # ...
```

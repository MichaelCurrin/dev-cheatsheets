# Github actions cheatsheet

- [Configuring and managing workflows](https://help.github.com/en/actions/configuring-and-managing-workflows/configuring-a-workflow) from actions docs
- [Syntax](https://help.github.com/en/actions/reference/workflow-syntax-for-github-actions)
- [Github Actions Documentation](https://help.github.com/en/actions)

Applies to pushes on master and branches, even if no PR.

```yaml
on: push
```

This comes from the docs but doesn't seem to add much from above.

```yaml
on: [push, pull_request]
```

Or trigger on Pull Request only. This is useful if you enforce checks passing in repo branch rules, which also means that PRs ar en
```yaml
on: pull_request
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTk1NzM3ODQ2N119
-->
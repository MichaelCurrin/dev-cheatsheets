---
title: Actions
description: What an Actions is, how to use one and how to make your own
---


{% raw %}

- [GitHub Actions](https://docs.github.com/en/actions) in the docs.
- [GitHub Actions](https://github.com/features/actions) feature page.


## What is an Action?

For your GH Actions workflow steps, normally you just write shell commands.

To set up your language environment and to perform complex tasks, you'll often end up using an action from the GH Actions Marketplace.

- [Actions](https://github.com/marketplace?type=actions) in the Marketplace.

An action is a repo on GitHub that is properly packaged to run in a workflow and is written in TypeScript or using Docker.

- [Creating actions](https://docs.github.com/en/actions/creating-actions) in the docs.

You can use any repo but only ones that have been approved by GitHub make it to the Marketplace where they can be searched for. They also get a Marketplace doc page, which comes from the repo's README.md file.


## How to use an Action

An Action exists as a public repo on GitHub.

GitHub provides many actions under a certain account:

- [actions](https://github.com/actions).

For example:

- [actions/checkout@v2](https://github.com/actions/checkout)
- [actions/setup-node](https://github.com/actions/setup-node)

Use one like this:

```yaml
steps:
  - uses: actions/checkout@v2

  - uses: actions/setup-node@v2
    with:
      node-version: '12'
```

You can reference an action in a subdirectory like this.

Based on [cancel-outdated-builds](https://github.com/rust-lang/simpleinfra/tree/master/github-actions/cancel-outdated-builds) insructions.

```yaml
- name: Cancel outdated builds
  uses: rust-lang/simpleinfra/github-actions/cancel-outdated-builds@master
```

{% endraw %}

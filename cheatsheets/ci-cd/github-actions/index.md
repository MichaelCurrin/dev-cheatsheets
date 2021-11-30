---
logo: githubactions
description: Guide to syntax for GitHub Actions workflows
---
# GitHub Actions

### About

This section covers how to use GitHub Actions in a CI/CD flow such as you run automated tests, deploy and publish your repo. All running for free in the cloud whenever the workflow is triggered such as with a push or merged Pull Request.

To use GH Actions, you must create a workflow YAML file with appropriate fields set including triggers and steps. You can write shell commands as _steps_ and you can use use actions from the GH Marketplace to help you set up your environment (install a language and packages) and perform test and deploy steps, without you having to write a lot of code.

### Getting started

Here are some other areas to start with:

- Workflow syntax and samples / use-cases around them
    - [Jobs][]
    - [Triggers][]

[Jobs]: {% link cheatsheets/ci-cd/github-actions/jobs.md %}
[Triggers]: {% link cheatsheets/ci-cd/github-actions/triggers.md %}

### Related

- [GH Actions](https://michaelcurrin.github.io/dev-resources/resources/ci-cd/github-actions/) in Dev Resources. For external links such as to docs, to help you get into how Actions work and the syntax.
- [GH Actions](https://michaelcurrin.github.io/dev-resources/resources/ci-cd/github-actions/) recipes in Code Cookbook.
- [GH Actions Jekyll Quickstart](https://github.com/MichaelCurrin/jekyll-gh-actions-quickstart) - deployed with GH Actions and GH Pages.
- [React Quickstart](https://github.com/MichaelCurrin/react-quickstart) - deployed with GH Actions and GH Pages.
- [Vue Quickstart](https://github.com/MichaelCurrin/vue-quickstart) - deployed with GH Actions and GH Pages.

---
layout: listing
logo: githubactions
---
# GitHub Actions
> Guide to syntax for GitHub Actions workflows


## Intro

### About

This section covers how to use GitHub Actions in a CI/CD flow such as you run automated tests, deploy and publish your repo. All running for free in the cloud whenever the workflow is triggered such as with a push or merged Pull Request.

To use GH Actions, you must create a workflow YAML file with appropriate fields set including triggers and steps. You can write shell commands as _steps_ and you can use use actions from the GH Marketplace to help you setup your environment (install a language and packages) and perform test and deploy steps, without you having to write a lot of code.

### Getting started

Here are some other areas to start with:

- Workflow syntax and samples / use-cases around them
    - [Jobs](jobs.md)
    - [Triggers](triggers.md)
- [Resources](resources.md) for external links such as to docs, to help you get into how Actions work and the syntax

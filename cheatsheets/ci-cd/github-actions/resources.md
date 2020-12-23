---
description: External links around GH Actions, from basic to advanced usage
---
# Resources

If you are new to GitHub Actions, I recommend going over my blog posts on dev.to - [Intro to GitHub Actions series](https://dev.to/michaelcurrin/series/9032)


## Overview

- [GitHub Actions Marketplace](https://github.com/marketplace)
- [GitHub Actions](https://github.com/actions) org on Github
- [GitHub Actions](https://github.community/c/github-actions) community forums


## Documentation

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Configuring and managing workflows](https://docs.github.com/en/actions/configuring-and-managing-workflows/configuring-a-workflow)
    - A good step-by-step tutorial for setting up GH Actions
- [Environment variables](https://docs.github.com/en/actions/configuring-and-managing-workflows/using-environment-variables)
- _Getting Started_ section
    - [Core concepts](https://docs.github.com/en/actions/getting-started-with-github-actions/core-concepts-for-github-actions)
- _Reference_ section
    - [Workflow syntax](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions)
    - [Events that trigger workflows](https://docs.github.com/en/actions/reference/events-that-trigger-workflows)
    - [Context and expression syntax](https://docs.github.com/en/actions/reference/context-and-expression-syntax-for-github-actions)
    - [Workflow commands](https://docs.github.com/en/actions/reference/workflow-commands-for-github-actions)
        - e.g. Setting color to green or showing a warning message.
            ```yaml
            - name: Set selected color
              run: echo '::set-env name=SELECTED_COLOR::green'
            ```
        - This can be useful in workflows and when writing commands in the shell file for an action.


## Limitations

- [Intro to GitHub Actions blog post](https://gabrieltanner.org/blog/an-introduction-to-github-actions)
    > Actions are completely free for every open-source repository and include **2000 free build minutes per month** for all your private repositories which is comparable with most CI/CD free plans. If that is not enough for your needs you can pick another plan or go the self-hosted route.
- [Usage limits](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#usage-limits)
    > On the free tier you can have _20 concurrent jobs_. I guess 20 on one repo or 20 repos with one each.

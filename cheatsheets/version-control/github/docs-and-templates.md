---
title: Docs and templates
description: How to structure your repo with docs and templates that are used on GitHub
---


## Issue templates

Use the GH UI to help you:

1. Go to repo _Settings_.
2. Enable _Issues_.
3. Click _Set up templates_
4. Choose from one of the options:
    - Bug report
    - Feature request
    - Custom template
5. Update and save.

### Structure

The files sit in this directory:

- `.github/ISSUE_TEMPLATE/`

Note singular template.

This can have your markdown files in that.

e.g.

- `bug_report.md`
- `feature_request.md`

Example: [ISSUE_TEMPLATE](https://github.com/benbalter/jekyll-remote-theme/tree/master/.github/ISSUE_TEMPLATE) on `benbalter/jekyll-remote-theme` repo.


### Config

GH gives you a prompt to add a config file too.

> Customize the issue creation experience with a `config.yml` file. Learn more.

- [Configuring issue templates for your repository](https://docs.github.com/en/github/building-a-strong-community/configuring-issue-templates-for-your-repository)
    > You can customize the templates that are available for contributors to use when they open new issues in your repository.


### Bug report

- `bug_report.md`
    ```markdown
    ---
    name: Bug report
    about: Create a report to help us improve

    ---

    ### Describe the bug

    A clear and concise description of what the bug is.

    ### Steps to reproduce the behavior

    1. Go to '...'
    2. Click on '....'
    3. Scroll down to '....'
    4. See error

    ### Expected behavior

    A clear and concise description of what you expected to happen.

    ### Screenshots

    If applicable, add screenshots to help explain your problem.

    ### Additional context

    Add any other context about the problem here.
    ```

### Feature request

- `feature_request.md`
    ```markdown
    ---
    name: Feature request
    about: Suggest an idea for this project

    ---

    ### Is your feature request related to a problem? Please describe the problem you're trying to solve.

    A clear and concise description of what the problem is. Ex. I'm always frustrated when [...]

    ### Describe the solution you'd like

    A clear and concise description of what you want to happen.

    ### Describe alternatives you've considered

    A clear and concise description of any alternative solutions or features you've considered.

    ### Additional context

    Add any other context or screenshots about the feature request here.
    ```


### Contributors

#### Maintainers

- `MAINTAINERS.txt`

A list of users who maintain the project.

Here is a large and structured one - [MAINTAINERS.txt](https://github.com/pressflow/7/blob/master/MAINTAINERS.txt)

#### Code owners

The code owners file contains `@` mentions of users or groups and is used to auto-request reviews on PRs.

- `.github/CODEOWNERS`

Example: [CODEOWNERS](https://github.com/benbalter/jekyll-remote-theme/blob/master/.github/CODEOWNERS) on `benbalter/jekyll-remote-theme`

You can also link to the GitHub contributors page:

e.g.

```markdown
presite © egoist, Released under the MIT License.
Authored and maintained by egoist with help from contributors (list).
```

Here is a sample list:

- [github.com/egoist/presite/graphs/contributors](https://github.com/egoist/presite/graphs/contributors)


## Pull Request templates

See [Tutorial](https://help.github.com/en/github/building-a-strong-community/creating-a-pull-request-template-for-your-repository) on GH docs.

Create a file with this path like one of these:

- `pull_request_template.md`
- `docs/pull_request_template.md`
- `.github/pull_request_template.md`

Note that lowercase looks like the preferred style. But you could do `PULL_REQUEST_TEMPLATE.md` at the root and it will work.

Or create a directory with a named file:

- `.github/PULL_REQUEST_TEMPLATE/foo.md`

Note singular template.

For the content:

> In the body of the new file, add your pull request template. This could include:
>
> - A reference to a related issue in your repository.
> - A description of the changes proposed in the pull request.
> - @mentions of the person or team responsible for reviewing proposed changes.

For example. Include exactly as it here with comments. The PR creator must then edit the messsage that is generated. Of course replace the username at the top with a maintainer's name.

```markdown
@MichaelCurrin


## Description

<!-- Add details -->


## Issues

<!-- Link to an issue if there is one. -->
<!-- closes #1 -->


<!--  Please also add labels to the PR using Github's labelling e.g. enhancement, bug, translation
```

Or questions to be answered.

```markdown
As part of the code review process please run branch locally and review
 
- Is the AC being met?
- Are there odd behaviors?
- Are all necessary tests present?
```


## Contributing doc

Create as either:

- `docs/CONTRIBUTING.md`
- `CONTRIBUTING.md`

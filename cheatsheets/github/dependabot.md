---
title: Dependabot
---



## Resources

- [@dependabot](https://github.com/dependabot) on GitHub
- [Configuring GitHub Dependabot security updates](https://docs.github.com/en/free-pro-team@latest/github/managing-security-vulnerabilities/configuring-github-dependabot-security-updates)
- [About GitHub Dependabot version updates](https://docs.github.com/en/free-pro-team@latest/github/administering-a-repository/about-github-dependabot-version-updates)
- [ Keep all your packages up to date with Dependabot ](https://github.blog/2020-06-01-keep-all-your-packages-up-to-date-with-dependabot/) blog post

See also [snyk.io](https://snyk.io) which is outside of GitHub but it works similarly - it creates PRs for vulnerabilities.


## Enable and disable

Dependabot will be turned on by default for your **public** GitHub repos at the profile level and at the repo level, but you can disable it at either level.

Optionally turn on for private repos.

> GitHub detects and alerts users to vulnerable dependencies in public repositories by default. Owners of private repositories, or people with admin access, can enable GitHub Dependabot alerts by enabling the dependency graph and GitHub Dependabot alerts for their repositories. [source](https://docs.github.com/en/free-pro-team@latest/github/managing-security-vulnerabilities/about-alerts-for-vulnerable-dependencies#github-dependabot-alerts-for-vulnerable-dependencies)


## Configure

Under a repo's _Insights_ tab and the _Dependency graph_ section, there is a dependabot section where you can create a dependabot config if you want to.


Here is a sample:

```yaml
version: 2
updates:
  - package-ecosystem: "" # See documentation for possible values
    directory: "/" # Location of package manifests
    schedule:
      interval: "daily"
```

Here is the help:

> To get started with Dependabot version updates, you'll need to specify which
> package ecosystems to update and where the package manifests are located.
>
> Please see the documentation for all configuration options:
> [configuration-options-for-dependency-updates](https://help.github.com/github/administering-a-repository/configuration-options-for-dependency-updates).


## Disclaimer

> Note: GitHub's security features do not claim to catch all vulnerabilities. Though we are always trying to update our vulnerability database and alert you with our most up-to-date information, we will not be able to catch everything or alert you to known vulnerabilities within a guaranteed time frame. These features are not substitutes for human review of each dependency for potential vulnerabilities or any other issues, and we recommend consulting with a security service or conducting a thorough vulnerability review when necessary. [source](https://docs.github.com/en/free-pro-team@latest/github/managing-security-vulnerabilities/about-alerts-for-vulnerable-dependencies#github-dependabot-alerts-for-vulnerable-dependencies)

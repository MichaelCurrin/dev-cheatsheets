# Dependabot

## Resources

- [@dependabot](https://github.com/dependabot) on GitHub
- [Configuring GitHub Dependabot security updates](https://docs.github.com/en/free-pro-team@latest/github/managing-security-vulnerabilities/configuring-github-dependabot-security-updates)
- [About GitHub Dependabot version updates](https://docs.github.com/en/free-pro-team@latest/github/administering-a-repository/about-github-dependabot-version-updates)
- [ Keep all your packages up to date with Dependabot ](https://github.blog/2020-06-01-keep-all-your-packages-up-to-date-with-dependabot/) blog post


## Enable and disable

Dependabot will be turned on my default for your GitHub repos at the profile level and at the repo level, but you can disable it at either level.


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

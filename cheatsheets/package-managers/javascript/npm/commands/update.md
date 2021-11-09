# update

- [npm-update](https://docs.npmjs.com/cli/v7/commands/npm-update) docs

> update all the packages listed to the latest version (specified by the tag config),
> 
> respecting the semver constraints of both your package and its dependencies (if they also require the same package).

This will also install missing packages.


## Related

- [install][] command
- [outdated][] command
- [Install packages][]
- [Maintain packages][]
- [Upgrade packages][]

[install]: {{ site.baseurl }}{% link cheatsheets/package-managers/javascript/npm/commands/install.md %}
[outdated]: {{ site.baseurl }}{% link cheatsheets/package-managers/javascript/npm/commands/outdated.md %}
[Install packages]: {{ site.baseurl }}{% link cheatsheets/package-managers/javascript/npm/install-packages.md %}
[Maintain packages]: {{ site.baseurl }}{% link cheatsheets/package-managers/javascript/npm/maintain-packages.md %}
[Upgrade packages]: {{ site.baseurl }}{% link cheatsheets/package-managers/javascript/npm/upgrade-packages.md %}


## Upgrade all

```sh
$ npm update 
```


## Upgrade one

```sh
$ npm update PACKAGE_NAME
```

Or

```sh
$ npm install --upgrade PACKAGE_NAME
```


## Ignore scripts

Turn off pre- and post-install scripts.

```sh
$ npm update --ignore-scripts
```


## Global

```sh
$ npm update --global
```


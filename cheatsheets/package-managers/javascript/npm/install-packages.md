# Install packages

You must create a `package.json` file with `npm init` before you can run installs in a project.

See cheatsheets for:

- [npm install][] command.
- [npm ci][] command for production and automated deploys.

[npm install]: {{ site.basurl }}{% link cheatsheets/package-managers/javascript/npm/commands/install.md %}
[npm ci]: {{ site.basurl }}{% link cheatsheets/package-managers/javascript/npm/commands/ci.md %}


## View

Get info on a package before installing it.

```sh
$ npm view @vue/cli
```

```
@vue/cli@4.5.11 | MIT | deps: 35 | versions: 140
Command line interface for rapid Vue.js development
https://cli.vuejs.org/
...
dist-tags:
latest: 4.5.11       next: 5.0.0-alpha.4
```


## Clear cache

- [npm cache](https://docs.npmjs.com/cli/v7/commands/npm-cache) docs.

The clean command CLI and docs you to not use this unless you know what you are doing and also it only works with `--force` flag.

This will delete the cache of downloaded packages - useful for making a Docker image smaller as the cache is not needed for running.

```sh
$ npm cache clean --force
```

> clean: Delete all data out of the cache folder. Note that this is typically unnecessary, as npm's cache is self-healing and resistant to data corruption issues.

> ... For this reason, it should never be necessary to clear the cache for any reason other than reclaiming disk space, thus why clean now requires --force to run.

# outdated

- [npm-outdated](https://docs.npmjs.com/cli/v7/commands/npm-outdated) docs


## Related

- [update][] command
- [Install packages][]
- [Maintain packages][]
- [Upgrade packages][]

[update]: {{ site.baseurl }}{% link cheatsheets/package-managers/javascript/npm/commands/update.md %}
[Install packages]: {{ site.baseurl }}{% link cheatsheets/package-managers/javascript/npm/install-packages.md %}
[Maintain packages]: {{ site.baseurl }}{% link cheatsheets/package-managers/javascript/npm/maintain-packages.md %}
[Upgrade packages]: {{ site.baseurl }}{% link cheatsheets/package-managers/javascript/npm/upgrade-packages.md %}


## Basic

```console
$ npm outdated
Package   Current    Wanted    Latest  Location
aws-sdk   2.882.0  2.1024.0  2.1024.0  myrepo-lib-utils
dd-trace   0.33.2    0.33.2     1.5.1  myrepo-lib-utils
pg          8.5.1     8.7.1     8.7.1  myrepo-lib-utils
```

If a package is not yet installed, it will appear as missing. Here, Vue 2 is the "latest" on NPM even though Vue 3 has been out for a long time, so the `Latest` value is not accurate.

```console
$ npm outdated
Package  Current  Wanted  Latest  Location
vue      MISSING  3.2.21  2.6.14  vue-quickstart
```

## Global

```console
$ npm outdated --global
```


## Output formats

### JSON

```console
$ npm outdated --json
{
  "aws-sdk": {
    "current": "2.882.0",
    "wanted": "2.1024.0",
    "latest": "2.1024.0",
    "location": "node_modules/aws-sdk"
  },
  "dd-trace": {
    "current": "0.33.2",
    "wanted": "0.33.2",
    "latest": "1.5.1",
    "location": "node_modules/dd-trace"
  },
  "pg": {
    "current": "8.5.1",
    "wanted": "8.7.1",
    "latest": "8.7.1",
    "location": "node_modules/pg"
  }
}
```

### Long output

Add `Package Type` column and `Homepage` column (using `homepage` field from `package.json` of installed packages.

```sh
$ npm outdated --long
```

e.g.

```console
$ npm outdated --long
Package   Current    Wanted    Latest  Location             Package Type  Homepage
aws-sdk   2.882.0  2.1024.0  2.1024.0  myrepo-lib-utils  dependencies  https://github.com/aws/aws-sdk-js
dd-trace   0.33.2    0.33.2     1.5.1  myrepo-lib-utils  dependencies  https://github.com/DataDog/dd-trace-js#readme
pg          8.5.1     8.7.1     8.7.1  myrepo-lib-utils  dependencies  https://github.com/brianc/node-postgres
```

e.g. Here, nothing in installed yet.

```console
$ npm outdated --long
Package  Current  Wanted  Latest  Location        Package Type  Homepage
vue      MISSING  3.2.21  2.6.14  vue-quickstart  dependencies
```

### Parseable

> Output parseable results from commands that write to standard output. For npm search, this will be tab-separated table format.


```console
$ npm outdated --parseable
/Users/mcurrin/src/myrepo/mydir/node_modules/aws-sdk:aws-sdk@2.1024.0:aws-sdk@2.882.0:aws-sdk@2.1024.0
/Users/mcurrin/src/myrepo/mydir/node_modules/dd-trace:dd-trace@0.33.2:dd-trace@0.33.2:dd-trace@1.5.1
/Users/mcurrin/src/myrepo/mydir/node_modules/pg:pg@8.7.1:pg@8.5.1:pg@8.7.1
```

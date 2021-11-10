# outdated

- [npm-outdated](https://docs.npmjs.com/cli/v7/commands/npm-outdated) docs
    > This command will check the registry to see if any (or, specific) installed packages are currently outdated.

```sh
$ npm outdated
```


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

```sh
$ npm outdated
```

If there is nothing to update, you'll get a success exit code and no output.

```console
$ npm outdated
$ echo $?
0
```

But if there _are_ outdated packages, you'll get an error exit code and some output:

e.g.

```console
$ npm outdated
Package   Current    Wanted    Latest  Location
aws-sdk   2.882.0  2.1024.0  2.1024.0  myrepo-lib-utils
dd-trace   0.33.2    0.33.2     1.5.1  myrepo-lib-utils
pg          8.5.1     8.7.1     8.7.1  myrepo-lib-utils
```

e.g.

```console
$ npm outdated
Package             Current  Wanted  Latest  Location
eslint                6.8.0   6.8.0   7.7.0  preact-quickstart
jest                 24.9.0  24.9.0  26.4.0  preact-quickstart
jest-preset-preact    1.0.0   1.0.0   4.0.2  preact-quickstart
sirv-cli              1.0.3   1.0.3   1.0.6  preact-quickstart
```

### Missing

If a package is not yet installed, it will appear as **MISSING**.

```console
$ npm outdated
Package  Current  Wanted  Latest  Location
vue      MISSING  3.2.21  2.6.14  vue-quickstart
echo $?
1
```

### Warning on latest

Here after `npm install` or `npm install vue@next`:

```console
$ npm outdated
Package  Current  Wanted  Latest  Location
vue       3.2.21  3.2.21  2.6.14  vue-quickstart
$ echo $?
1
```

Notes:

- Here, Vue 2 is the "latest" on NPM even though Vue 3 has been out for a long time. So the `Latest` value is not accurate above and that also means that the command appears as a failure as there is something to uppgrade, even though there isn't/
- But the `Wanted` column still follows the `^3.0.0` setting in `package.json` and give the highest within that.


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

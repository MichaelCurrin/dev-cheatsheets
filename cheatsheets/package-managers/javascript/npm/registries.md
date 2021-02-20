---
title: Package registries
description: Where to download Node packages from
---


## Overview


Location | Command | Explore | Download URL
--- | --- | --- | ---
NPM registry |  `npm install @vue/cli` |  `registry.npmjs.org/react` | `npm.pkg.github.com/@vue/cli`
GitHub repo | `npm install https://github.com/vuejs/vue-cli` | `https://github.com/vuejs/vue-cli` | n/a


## Registry or not

A developer can publish to an NPM package registry like NPM or GitHub. These require authenicating and using a _publish_ step as part of your deploy workflow.

If you don't want go through that hassle for your project and you care more about using your own project than others finding and installing it, there is another much lighter approach. See [GitHub repos as a registry](#github-repos-as-a-registry) section. 

The GitHub repo approach makes using code on public repos easy. The downside is that when you install a package from GitHub, you machine will have to download content it might not need and it might have to compile, bundle and minify JS code. Compared to using a package which is already published on NPM as a ready-to-use optimized JS file.


## NPM

[registry.npmjs.org/](https://registry.npmjs.org/)

Help from `npm install -h`:

```
npm install [<@scope>/]<pkg>
npm install [<@scope>/]<pkg>@<tag>
npm install [<@scope>/]<pkg>@<version>
npm install [<@scope>/]<pkg>@<version range>
```

### Download by package name

There are a limited set of unique package names on NPM.

- `npm.pkg.github.com/PACKAGE`
- e.g. [npm.pkg.github.com/react](https://npm.pkg.github.com/react)

Use as:

```sh
$ npm install PACKAGE
$ # e.g.
$ npm install react
```

### Download by org name and package name

Some packages are published under an organization / username, to show ownership and to make it easy to find all their packages.

- `https://npm.pkg.github.com/@ORG/PACKAGE`
- e.g. [registry.npmjs.org/@vue/cli](https://registry.npmjs.org/@vue/cli)
- e.g. [registry.npmjs.org/@vue/cli-plugin-babel](https://registry.npmjs.org/@vue/cli-plugin-babel)
- e.g. [registry.npmjs.org/@types/lodash](https://registry.npmjs.org/@types/lodash)

Use as:

```sh
$ npm install PACKAGE
$ # e.g.
$ npm install @vue/cli
```

Another reason to use this approach is if you want to publish a fork of a package without conflicting with the original package.

For example, `react` is taken, but you can publish a fork on NPM which people can `@my-user/react`.

```sh
$ npm install @my-user/react
```

#### Aliases

You can even set that up with an alias so you can import is as `react` in your app. It's probably better to be more explicit and verbose.

But anyway in can you do want to use the alias, here is how I did it before.

Help from `npm install -h`:

```
...
npm install <alias>@npm:<name>
```

Example:

```sh
$ yarn add vue-markdown@npm:@adapttive/vue-markdown
```

Changes in `package.json`:

```diff
{
  "dependencie": {
    -"vue-markdown": "^2.2.4"
    +"vue-markdown": "npm:@adapttive/vue-markdown@3.0.0-beta.2"
  }
}
```


## GitHub registry

[npm.pkg.github.com](https://npm.pkg.github.com)

Setup a config to tell your NPM command to look at GitHub.

- `.npmrc`
    ```
    registry=https://npm.pkg.github.com/@octo-org
    ```

Note:

> By default, you can only use GitHub Packages packages from one organization.

See the doc linked below for info on to use multiple orgs.

### Download by package name

- `https://npm.pkg.github.com/PACKAGE`

### Download by org and package name

- `https://npm.pkg.github.com/@ORG/PACKAGE`

Install from GitHub. Make sure you use the owner name in both the URL above and the name below.

```sh
$ npm install @octo-org/octo-app
```

### Install from NPM

With GitHub setup, you can still install NPM registry.

```sh
$ npm install @babel/core
$ npm install @lodash  # Matches standard use of installing 'lodash', I think.
```

### Resources

- [Introducing GitHub Package Registry](https://github.blog/2019-05-10-introducing-github-package-registry/) on GitHub's blog.
- [Configuring npm for use with GitHub Packages](https://docs.github.com/en/packages/guides/configuring-npm-for-use-with-github-packages)
    - How to publish an NPM package to GitHub's registry
 
 
## GitHub repos as a registry

When to make your NPM package installable from GitHub.

- Avoid the redtape and process of signing up for an NPM account and using `npm publish` and a token.
- For hobby projects that you don't expect others to use or find.
- For installing from `master` / `main` without having to publish a release version first. This makes your own projects easier and also means you can install the absolute latest code on a public GitHub repo before they publish their code to NPM.
- For private projects that only you use or users in your company can install.

Help from running `npm install -h`:

```
...
npm install <git:// url>
npm install <github username>/<github project>
```

### Download from public repo

Given repo `https://github.com/USERNAME/REPO_NAME` which has a `package.json` at the root.

```sh
$ npm install https://github.com/USERNAME/REPO_NAME@COMMIT_REF
```

e.g. Install from `master` branch.

```sh
$ npm install https://github.com/vuejs/vue-cli
$ npm install https://github.com/vuejs/vue-cli#develop
```

### Download from private repo

Assuming you have your SSH keys setup locally and on GitHub, for access to private repos.

```sh
$ npm install git+ssh://git@github.com:USERNAME/REPO_NAME.git
```

This does something like this internally.

```sh
$ git clone git@github.com:USERNAME/REPO_NAME.git
```

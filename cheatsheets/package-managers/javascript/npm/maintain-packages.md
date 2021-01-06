---
description: How to monitor and maintain your project's packages (dependencies)
---
# Maintain packages


From article [These NPM tricks will make you a pro](https://www.freecodecamp.org/news/10-npm-tricks-that-will-make-you-a-pro-a945982afb25/) on FreeCodeCamp.

## List

```sh
$ npm list
```

### Flags

- `--depth=0` - Top-level packages.
- `-g` - Global packages.

## Remove duplicates

```sh
$ npm dedupe
```

## Outdated


```sh
$ npm outdated
```

## Update

Update packages to the latest versions. This will stay within the bounds set by `package.json` such as `~` or `^`.

```sh
$ npm update
```

If you want to force _everything_ to the most modern version, ignoring the versions set in `package.json`, run this:

```sh
$ npx npm-update-all
```

That downloads and runs the `npm-update-all` package.


## Open pages

Open the repository, homepage or docs page in your browser.

```sh
$ npm repo PACKAGE
$ npm home PACKAGE
$ npm docs PACKAGE
```


## Clean scripts

<!-- TODO move to Cookbook -->

```json
{
  "scripts": {
    "test": "jest",
    "format": "eslint src --fix"
  }
}
```


## Customize IDE

Add this to VS Code settings

```
npm.enableScriptExplorer: true
```


## Set defaults

Tired of setting up using `npm init` or `npm init -y` commands?

Then change defaults.

```sh
$ npm config set init.author.name "Carl-Johan (C-J) Kihl"
$ npm config set init.author.email "carljohan.kihl@mail.com"
```

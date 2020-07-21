# Maintain packages
> How to monitor and maintain your project's packages (dependencies)


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

```sh
$ npm update
```

Note that the above command will still honor the caret and tilde limits so you won't get the newest always.

If you want to force everything to the most modern version, run:


```sh
$ npx npm-update-all
```

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

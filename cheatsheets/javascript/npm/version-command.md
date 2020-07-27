---
title: The npm version command
---

This NPM command allows easy incrementing in both package files and git tags, with a given tag or increment level.

- [npm-version](https://docs.npmjs.com/cli/version) docs
    > Run this in a package directory to bump the version and write the new data back to package.json, package-lock.json, and, if present, npm-shrinkwrap.json.
    >
    > ...
    >
    > If run in a git repo, it will also create a version commit and tag.


## Warning notes

- This requires Node.js / NPM to be installed.
- This only works if a project with a `package.json` file.
- This does not fetch remote tags, so you have to ensure yourself that you don't duplicate a remote tag.


## Tagging

Here is simple usage of the CLI usage:

```sh
$ npm version major

$ npm version minor

$ npm version patch
```


## Commands

This also allows setting commands to run when you run `npm version [options]`.

For example:

```json
{
  "scripts": {
    "preversion": "npm test",
    "version": "npm run build && git add -A dist",
    "postversion": "git push && git push --tags && rm -rf build/temp"
  }
}
```

Note: You should probably run `git fetch --tags` first to make sure you don't increment to a tag which already exists on the remote. So adding that logic into `preversion` would make that automated.


## Resources

- [semvar](https://docs.npmjs.com/misc/semver) NPM package.
- [About semantic versioning](https://docs.npmjs.com/about-semantic-versioning) in NPM docs.

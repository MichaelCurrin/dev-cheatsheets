# NPM version command

There is functionality built into NPM around versioning. This allows easy incrementing in both package files and git tags, with a given tag or increment level.

- [npm-version](https://docs.npmjs.com/cli/version)

> Run this in a package directory to bump the version and write the new data back to package.json, package-lock.json, and, if present, npm-shrinkwrap.json.
>
> ...
>
> If run in a git repo, it will also create a version commit and tag.

See also [semvar](https://docs.npmjs.com/misc/semver) NPM package.


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
"scripts": {
  "preversion": "npm test",
  "version": "npm run build && git add -A dist",
  "postversion": "git push && git push --tags && rm -rf build/temp"
}
```

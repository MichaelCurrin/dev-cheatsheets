---
title: Approaches to run
description: When and how to run ESLint
---


## Manually

### During development

Run this manually, if you have it configured in `package.json`.

```sh
$ npm run lint:fix
```

Run ad hoc. This will use the project package, or the global package or it will download and run if not installed.

Plain JS:

```sh
$ npx eslint . --fix
```

TypeScript:

```sh
$ npx eslint . --ext .ts --fix
```
    
    
## Before an event

As a manual step before pushing code or building/pushing a release.

```sh
$ npm run lint:check
```


## Hook

As an automated hook locally.

- Like on every commit or on a push.
- Using Git hooks or a JS package like Husky.
- Add to `preversion` in `package.json`, so it runs automatically for when you run `npm version TAG_NAME` to make a tag.


## CI

As part of CI on a remote build system.

- Run lint checks on CircleCI or GH Actions.
- You can even set up GH Actions to fix up the code and add a commit for you. But that level of automation may be more trouble than its worth. You'll find put that your build failed because of a lint issue, so you can then change and push changes.
- Note that some problems in syntax cannot be auto-fixed - so be prepared to make changes locally anyway.
- If you have a pre-commit or pre-push hook, then your code on GitHub will be cleaner when it goes through the CI. But having the CI checks is good - in case you make a commit directly on GitHub. And in case someone has not set up hooks locally (git hooks need manual set up but NPM husky hooks I think run automatically if defined in `package.json`.

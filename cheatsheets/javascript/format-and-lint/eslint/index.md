---
title: ESLint
description: Find and fix problems in your JS code
---

### About

ESLint can statically analyze your JS code to find and fix problems.

It can check syntax that is invalid. It gives errors and warnings.


### When is good to run ESLint?

- Anytime, manually.
    ```sh
    $ npm run lint:fix
    ```
    ```sh
    $ npx eslint . --ext .ts --fix
    ```
- As a hook - like on every commit or on a push.
- As a pre-release step - add to `preversion` in `package.json`, for when you run `npm version TAG`.
- As part of CI.
    - Run lint checks on CircleCI or GH Actions.
    - You can even set up GH Actions to fix up the code and add a commit for you. But that level of automation may be more trouble than its worth. You'll find put that your build failed because of a lint issue, so you can then change and push changes.
    - Note that some problems in syntax cannot be auto-fixed - so be prepared to make changes locally anyway.
    - If you have a pre-commit or pre-push hook, then your code on GitHub will be cleaner when it goes through the CI. But having the CI checks is good - in case you make a commit directly on GitHub. And in case someone has not set up hooks locally (git hooks need manual set up but NPM husky hooks I think run automatically if defined in `package.json`.

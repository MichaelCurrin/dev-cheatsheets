---
title: ESLint
description: Find and fix problems in your JS code
---

### About

ESLint can statically analyze your JS code to find and fix problems.

It can syntax that is invalid. It can give warnings (like a variable that is unused or was never declared). You can customize what you want to be alerted on and you can change a warning level to an error level.

You can also enforce some styling and formatting issues which don't affect functionality. Like indenting code, wrapping lines, trailing semi-colons and trailing commas (for the last item in a structure). If you set up ESLint right, you might not even need Prettier.


### When should run ESLint?

- Anytime, manually.
    ```sh
    $ npm run lint:fix
    $ # eslint . --ext .ts --fix
    ```
- As a hook - like on every commit or on a push.
- As a pre-release step - add to `preversion` in `package.json`, for when you run `npm version TAG`.
- As part of CI.
    - Run lint checks on CircleCI or GH Actions.
    - You can even set up GH Actions to fix up the code and add a commit for you. But that level of automation may be more trouble than its worth. You'll find put that your build failed because of a lint issue, so you can then change and push changes.
    - Note that some problems in syntax cannot be auto-fixed - so be prepared to make changes locally anyway.
    - If you have a pre-commit or pre-push hook, then your code on GitHub will be cleaner when it goes through the CI. But having the CI checks is good - in case you make a commit directly on GitHub. And in case someone has not set up hooks locally (git hooks need manual set up but NPM husky hooks I think run automatically if defined in `package.json`.

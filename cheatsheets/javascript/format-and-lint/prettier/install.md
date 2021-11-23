# Install

Install it globally.

```sh
$ npm i -g prettier
$ prettier -h
```

Or install it in a project.

```sh
$ npm i --save-dev prettier
```

If you've set it up in your NPM scripts, you can run like this:

```sh
$ npm run format
```

Otherwise, run ad hoc commands on the CLI as:

```sh
$ npx prettier
```

Using `npx` here works even if `prettier` is not installed anywhere.

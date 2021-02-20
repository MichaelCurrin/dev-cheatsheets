---
title: Migrating from Node
description: A guide for Node.js developers for moving to Deno
---

How to do something in a Node/NPM project and the equivalent in a Deno project.


## Package management

| Area                                    | Node and NPM                                                                                             | Deno                                                                                                                                          |
| --------------------------------------- | ---------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| Package management file                 | `package.json` with `dependencies` section                                                           | Use imports by URL inline, or use `deps.ts` (commonly used) or `import_map.json` (unstable)                                                   |
| Package lock file                       | `package-lock.json` | `lock.json` and `deno cache --lock=lock.json --lock-write src/deps.ts` - see [Integrity checking & lock files][] in the docs. |
| Install a package `npm install PACKAGE` | Add a package's URL to imports of a module and then run `deno run index.ts` or `deno cache index.ts` |
| Install packages                        | `npm install`                                                                                        | `deno run index.ts` (missing packages will be installed) or `deno cache index.ts`                                                             |
| Upgrade packages                        | `npm update`                                                                                         | `deno cache --reload index.ts` or change locked version numbers and install                                                                   |
| Registry                                | [npmjs.com](https://www.npmjs.com)                                                                  | Standard lib: [deno.land/std](https://deno.land/std), 3rd party: [deno.land/x](https://deno.land/x) or CDNs - see more in [Modules][] section |
| Browser a package in the registry       | Example: [npmjs.com/package/vue][] | Example: [deno.land/x/oak][] or `https://deno.land/x/oak@v6.5.0`

[Modules]: {{ site.baseurl }}{% link cheatsheets/javascript/deno/modules/index.md %}
[Integrity checking & lock files]: https://deno.land/manual/linking_to_external_code/integrity_checking
[npmjs.com/package/vue]: https://www.npmjs.com/package/vue
[deno.land/x/oak]: https://deno.land/x/oak


## Project maintenance

| Area                    | Node and NPM                                                                                                                                                                 | Deno                                                                                                                                                         |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Task runner             | `package.json` with `scripts` section and use `npm run COMMAND`                                                                                                          | Use `deno COMMAND` but using `Makefile` and `make` commands makes things light especially with all the permissions and `--unstable` flags that Deno needs    |
| Run a script            | `npm start` or `node index.js`                                                                                                                                           | `deno run index.ts` - also supports `.js`, `.jsx` and `.tsx`                                                                                                 |
| Lint code               | `npm run lint` with command pointing to `eslint . --fix` after installing ESLint                                                                                         | `deno lint` - includes JS linting support (using ESLint, JSHint and JSLint) and TS linting support out the box                                                                                               |
| Format code             | `npm run format` with command pointing to `prettier -w .` after installing Prettier                                                                                      | `deno fmt` - uses Prettier internally                                                                                                                        |
| Run tests               | `npm test`, with command pointing to `jest` or `jasmine` or `mocha` etc. after installing                                                                                | `deno test` - uses a test runner internally                                                                                                                  |
| Bundle app as a single JS file | `npm run build`, with command pointing to `webpack` or `babel` or some other package which needs to be installed and configured. | `mkdir build` and then `deno bundle index.ts build/bundle.js` - no external dependencies or config files needed. |
| Compile TypeScript code | `npm run compile` with command pointing to `tsc . -p` usually                                                                                                            | TypeScript support out the box. Use `deno bundle index.ts build/bundle.js`                                                                                   |
| Run TypeScript code     | `npm start` or `npm run dev`, with a command that uses a combination of two steps - TS compilation and then run JS files. Or use Vue or React runner which can run TS with a hidden in-memory compile step | Use `deno run index.ts` to run TS directly. No need to compile first. Or in two steps: `deno bundle index.ts build/bundle.js` and `deno run build/bundle.js` |

### Resources

- [Makefile](https://github.com/MichaelCurrin/deno-project-template/blob/main/Makefile) on my Deno Project Template.
- [Formatter](https://deno.land/manual/tools/formatter) in the docs.
- [Deno lint](https://github.com/denoland/deno_lint) repo.
- [Testing](https://deno.land/manual/testing) in the docs.

Note that minifying JS code is not supported directly in Node or Deno. See my [Minifiers][] guide for available packages.

[Minifiers]: https://michaelcurrin.github.io/dev-resources/resources/javascript/minifiers.html


## Configuration

| Area              | Node and NPM                                                                                                                 | Deno                                                                                                                    |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------- |
| TypeScript config | Use `tsconfig.json` to indicate root directory and this file should be picked by `tsc` command. Don't know if it is required | Optional `tsconfig.json` file and `deno run --tsconfig tsconfig.json` - you have to be explicit with the path.          |
| ESLint config     | Use `package.json` with ESLint section, or an ESLint config file                                                                   | `deno lint` supports the `recommended` set of rules from ESLint and `@typescript-eslint` out of the box with no config. |

See also [What is a tsconfig.json?](https://www.typescriptlang.org/docs/handbook/tsconfig-json.html) in TS docs

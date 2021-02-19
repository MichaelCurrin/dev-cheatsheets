---
title: Migrating from Node
description: A guide for Node.js developers for moving to Deno
---

How to do something in a Node/NPM project and the equivalent in a Deno project.


## Package management

Area | Node/NPM | Deno
---  | --- | ---
Package managment file | `package.json` with `dependencies` section | Use imports by URL inline, or use `deps.ts` (commonly used) or `import_map.json` (unstable)
Install a package `npm install PACKAGE` | Add a package's URL to imports of a module and then run `deno run index.ts` or `deno cache index.ts`
Install packages | `npm install` | `deno run index.ts` (missing packages will be installed) or `deno cache index.ts`
Upgrade packages | `npm update` | `deno cache --reload index.ts` or change locked version numbers and install
Registry | [npmjs.com](https://www.npmjs.com) | Standard lib: [deno.land/std](https://deno.land/std), 3rd party: [deno.land/x](https://deno.land/x) or CDNs - see more in [Modules][] section

[Modules]: {{ site.baseurl }}{% link cheatsheets/javascript/deno/modules.md %}


## Project mainenance

Area | Node/NPM | Deno
---  | --- | ---
Task runner | `package.json` with `scripts` section and use `npm run COMMAND` | Use `deno COMMAND` but using `Makefile` and `make` commands makes things light especially with all the permissions and `--unstable` flags that Deno needs
Run a script | `npm start` or `node index.js` | `deno run index.ts` - also supports `.js`, `.jsx` and `.tsx`
Lint code | `npm run lint` with command pointing to `eslint . --fix` after installing ESLint | `deno lint` - includes ESLint and TSConfig support out the box
Format code | `npm run format` with command pointing to `prettier -w .` after installing Prettier | `deno fmt` - uses Prettier internally
Run tests | `npm test`, with command pointing to `jest` or `jasmine` or `mocha` etc. after installing | `deno test` - uses a test runner internally
Compile TypeScript code | `npm run compile` with command pointing to `tsc . -p` usually | TypeScript support out the box. Use `deno bundle index.ts build/bundle.js`
Run TypeScript code | `npm run dev` that uses a combination of TS compilation and then running JS files as two steps, or using Vue or React runner which can run TS with a hidden compile step | Use `deno run index.ts` to run TS directly. No need to compile first. Or in two steps: `deno bundle index.ts build/bundle.js` and `deno run build/bundle.js`

### Resources

- [Makefile](https://github.com/MichaelCurrin/deno-project-template/blob/main/Makefile) on my Deno Project Template
- [Formatter](https://deno.land/manual/tools/formatter) in the docs
- [Deno lint](https://github.com/denoland/deno_lint) repo
- [Testing](https://deno.land/manual/testing) in the docs

Note that minifying JS code is not supported directly in Node or Deno. See my [Minifiers][] guide for available packages.

[Minifiers]: https://michaelcurrin.github.io/dev-resources/resources/javascript/minifiers.html


## Configuration

Area | Node/NPM | Deno
---  | --- | ---
TypeScript config | `tsconfig.json` - indicates root directory and this file should be picked by `tsc` command. Don't know if it is required | Optional `tsconfig.json` file and `deno run --tsconfig tsconfig.json` - you have to be explicit with the path.
ESLint config | `package.json` with ESLint section or an ESLint config | `deno lint` supports the `recommended` set of rules from ESLint and `@typescript-eslint` out of the box with no config.

See also [What is a tsconfig.json?](https://www.typescriptlang.org/docs/handbook/tsconfig-json.html) in TS docs

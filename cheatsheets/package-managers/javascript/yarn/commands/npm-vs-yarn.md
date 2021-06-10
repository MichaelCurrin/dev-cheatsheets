---
title: NPM vs Yarn
---

Based on [Yarn cheatsheet](https://devhints.io/yarn).

NPM | Yarn
--- | ---
`npm install gulp` |`yarn add gulp`
`npm install -D gulp` | `yarn add -D gulp`
`npm install gulp --save-dev` |	`yarn add gulp --dev` 
`npm install -g gulp` |	`yarn global add gulp`
`npm update` | `yarn upgrade`
`npm run build` | `yarn build`
`./node_modules/.bin/gulp` | `yarn run gulp`

Note that while NPM supports aliases like `install` / `add` and `update` / `upgrade`, Yarn is strict and gives errors. Weirdly, Yarn uses NPM's aliases, rather than the main commands.

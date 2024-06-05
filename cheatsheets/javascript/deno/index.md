---
logo: deno
---
# Deno


### What is Deno?

Deno is a JavaScript runtime which is a replacement to Node.js and with a few enhancements.

- [deno.land](https://deno.land/) - Deno homepage
    > A secure runtime for JavaScript and TypeScript.


### Why Deno?

Are you tired of choosing and managing separate dependencies which do all these tasks? The typical NPM packages used to solve the tasks are shown in brackets.

- Lint JS (ESlint)
- Format JS (Prettier)
- Bundle JS (Webpack, Bundler)
- Transpile to older JS (Webpack, Babel)
- Transpile JSX to plain JS (Webpack, Babel)
- Transpile TypeScript to plain JS (TypeScript)
- Run tests (Jasmine, Jest, Mocha ...)

Then consider using Deno. It is a modern alternative to Node.ks by the same author and it provides all the functionality just mentioned above - without installing dependencies. Deno actually used packages like ESLint and Prettier internally, you just know don't have to care.

Packages are managed using URLs in your code, which can be centralized in one if you prefer.

Running Deno with the explicit permissions it needs can be cumbersone. Insteading using `npm` and `package.json` to run commands, I find that `make` and `Makefile` work well. At least for Linux and macOS where `make` is standard.


### Template project

Get started with Deno easily by using my template project.

[![MichaelCurrin - deno-project-template](https://img.shields.io/static/v1?label=MichaelCurrin&message=deno-project-template&color=blue&logo=github)](https://github.com/MichaelCurrin/deno-project-template)

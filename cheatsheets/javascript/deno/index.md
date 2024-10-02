---
logo: deno
---
# Deno


See also [Deno](https://michaelcurrin.github.io/dev-resources/resources/javascript/deno/) in Dev Resources for links.

### What is Deno?

Deno is a JavaScript runtime which is a replacement to Node.js and with a few enhancements.

- [deno.land](https://deno.land/) - Deno homepage
    > A secure runtime for JavaScript and TypeScript.

### Key points

- **Built-in TypeScript Support**: Deno supports TypeScript out of the box, without needing external configuration or transpilers.
- **Security by Default**: Deno is secure by default, with no file, network, or environment access unless explicitly granted by the developer via permissions.
- **Simplified Module Management**: It uses ES Modules and URLs for importing packages, removing the need for a centralized package manager like npm.
- **Built-in Utilities**: Deno comes with built-in utilities such as a test runner, a linter, and a formatter, reducing the need for additional tools.
- **Modern Standard Library**: It includes a modern standard library focused on web compatibility, such as fetch, WebSocket, and other web APIs.
- **Compatibility with Web APIs**: Deno is aligned with browser standards, meaning many APIs available in the browser (like `fetch`) work similarly in Deno.
- **Single Executable**: Deno is distributed as a single executable, which simplifies the installation process. You can also compile your project code as a single executable for easy distribution.
- **No `node_modules` or `package.json`**: It eliminates the `node_modules` folder and `package.json` in favor of directly fetching and caching dependencies from URLs.
- **Async/await and Promises**: It uses modern JavaScript features like `async/await` and Promises natively.
- **Community-Driven Development**: It has an active and growing community with continuous updates and improvements.

### Why Deno?

Are you tired of choosing and managing separate dependencies which do all these tasks? The typical NPM packages used to solve the tasks are shown in brackets.

- Lint JS (ESlint)
- Format JS (Prettier)
- Bundle JS (Webpack, Bundler)
- Transpile to older JS (Webpack, Babel)
- Transpile JSX to plain JS (Webpack, Babel)
- Transpile TypeScript to plain JS (TypeScript)
- Run tests (Jasmine, Jest, Mocha ...)

Then consider using Deno. It is a modern alternative to Node.js by the same author and it provides all the functionality just mentioned above - without installing dependencies. Deno actually used packages like ESLint and Prettier internally, you just don't have to care.

### Tips

Packages are managed using URLs in your code. That can be messy for large projects but can be centralized in one file if you prefer.

Running Deno with the explicit permissions it needs can be cumbersone. Instead of using `npm` and `package.json` to run commands, I find that `make` and `Makefile` work well. At least for Linux and macOS where `make` is standard.


### Template project

Get started with Deno easily by using my template project.

[![MichaelCurrin - deno-project-template](https://img.shields.io/static/v1?label=MichaelCurrin&message=deno-project-template&color=blue&logo=github)](https://github.com/MichaelCurrin/deno-project-template)


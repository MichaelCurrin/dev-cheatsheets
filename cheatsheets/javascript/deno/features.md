# Features

What Deno includes or reasons to use Deno. Based on [post](https://dev.to/mbilgil/what-is-deno-41p3).

- Extensive standard lib.
- Sandboxed execution for security.
- Builtin-in support for:
    - Modern JavaScript.
    - Compatibility with the browser - Includes `fetch` and `window`, unlike Node.js.
    - TypeScript - Replaces installing TypeScript. And it can even execute TS directly without first compiling to JS.
    - ES Modules - Allow module imports as `import ...`. No more CommonJS `require` syntax
    - Promises - Includes `async-await` syntax. And top-level `await` (it was added to Node later).
    - Bundling - Replaces [Webpack](https://webpack.js.org) and [rollup](https://rollupjs.org/guide/en/))
    - Linting - Replaces ESLint
    - Formatting - Replaces Prettier
    - Testing - Replaces Jest, Jasmine etc.
- Replaces NPM.
    - No package manager needed (no `package.json` and no `node_modules`).
    - Install 3rd party packages from Deno's registry.
    - NPM packages can be installed to, but you'll probably need to reference a CDN which will provide your with a module file compatibile with Deno.
    - If you don't like having your package URLs (and their version numbers) spread throughout your scripts, you can make a central file which sets aliases for the URLs.

Deno runs on the server side but of course like Node.js it can be used to process and bundle scripts to be served on the frontend.

---
title: About
description: What is Node, why use it and what can you do with it?
---

Node (or "Node.js", or less commonly "NodeJS") is a **server-side** runtime environment for JavaScript. It is an alternative to the **browser** runtime environment (which was the first place JS was used).

Node can process JavaScript on a machine locally or in the cloud, even without a desktop display or a browser installed.

For interest, [Deno][] is another server-side environment of JS.

[Deno]: https://michaelcurrin.github.io/dev-resources/resources/javascript/deno/


## Why Node?

JavaScript generally works the same in the browser and in Node on the server.

You can use Node to write a backend application, or to build your frontend application, or you might do a mix where you have a Node server and also use Node to make your frontend. You could also leave out Node completely - write your frontend in HTML, CSS and JS and write your backend in Python, PHP or Java.

If you use pure browser-based JavaScript, you miss out on things that other languages (like Java, PHP, Ruby or Python) could do from early on.

- Tooling around things like:
    - Managing dependencies (stored in disk rather than in memory in the browser).
    - Code quality control.
    - Deployment, optimization and conversion between languages or to older versions of JS.
- Running a script as local file.
- Create a GUI.
- Do logic which is obscured from the user, so can include more expensive API calls, requests to a database, use of secret credentials, caching a respose to use.

There are many tasks covered in the next section which are difficult, impractical or impossible using _only_ the browser. Using Node means you can run these tasks locally or in the cloud, at speed, without a browser running (or even installed).

And with Node, you get access to write to files on disk or a local database, which is impractical using the browser alone - since for security reasons a browser cannot read or write files on your machine unless you explicitly save or upload a file.


## What is Node good for?

Node can be used for the following, among other use cases.

- Web scraping
- CLI tools
- Desktop applications
    - e.g. VS Code, WhatsApp
    - Often built with [Electron](https://michaelcurrin.github.io/dev-resources/resources/javascript/packages/electron/).
- Web applications
    - Rendering dynamic website content.
        - In the same way that PHP or Python web servers generate and return HTML pages.
        - You might host your app as a server on AWS (such as with EC2 or Kubernetes) or [Vercel](https://vercel.com/) (they actually turn your app into multiple server-less endpoints.
    - It can be used to make a REST API, sending and receiving JSON data.
        - The Express library is a common choice here.
        - Again might host your app on AWS or Vercel.
    - Serverless computing.
        - Scale cheaply and fast, having your script run in parallel, adapting as demand changes.
        - Use AWS _Lambda_ or Netlify _Functions_.
    - Single-Page Applications.
        - Like using [React][], [Vue][], or [Docsify][]. Where there is one `index.html` and the multi-page site experience is created dynamically using JavaScript.
        - For the common use case, a Node server is unnecessary to serve a SPA. So you can use any static hosting site to make your site public.
    - Rendering static sites.
        - Like using [VuePress][], [Nuxt][], or [Hexo][].
        - Use static hosting as described for SPA above.
    - Hybrid sites.
        - Nuxt renders static content for the initial load and search engine crawlers, then switches to SPA experience.
        - Next lets you choose between server-side rendering and statically rendered content, probably on different routes in the same app too.
- Mobile apps
    - Like using [React Native](https://michaelcurrin.github.io/dev-resources/resources/javascript/packages/react-native/).
- Games (web or desktop or mobile)

[React]: https://michaelcurrin.github.io/dev-resources/resources/javascript/packages/react
[Vue]: https://michaelcurrin.github.io/dev-resources/resources/javascript/packages/vue
[Docsify]: https://michaelcurrin.github.io/dev-resources/resources/javascript/packages/docsify/
[VuePress]: https://michaelcurrin.github.io/dev-resources/resources/javascript/packages/vuepress
[Nuxt]: https://michaelcurrin.github.io/dev-resources/resources/javascript/packages/nuxt/
[Hexo]: https://github.com/MichaelCurrin/hexo-quickstart

### Node as a build tool

Note that if have a Single-Page Application or a static site, you run Node to generate build output (a directory of HTML, JS, CSS and images).

Then the content gets stored somewhere for public access _static_ content.

At that point, Node is no longer needed.

For example, you can use Nginx, a Python web server (the builtin `http.server`) or VS Code's Live Server. Or deploy to GitHub Pages, Netlify, or AWS S3.

But of course, when you want to continue developing your app, you'll use Node to test it and then deploy it.


## Run JS directly

Node can run JS scripts directly.

```sh
$ node hello.js
```

Or you can use enter the interactive console in your terminal.

```sh
$ node
```
```
Welcome to Node.js v14.13.1.
> console.log('Hello, World!')
Hello, World!
```


## Node as a dev tool

Node can perform the following, using the NPM CLI.

- Package management.
    - Download packages.
    - Upgrade packages when newer ones are available - especially useful for security updates.
- Quality checks (using an installed NPM package)
    - Lint code. e.g. `npm run lint` or `npx eslint .`
    - Format code. e.g. `npm run fmt` or `npx prettier -w .
    - Run tests. e.g. `npm test`
    - Run typechecks for TypeScript projects. e.g. `npm run compile`
- Do production builds
    - Minify to reduce the size of the content to be downloaded.
    - Bundle - to collect all your JS modules and external libraries and bundle them as a single JS file.
    - Transpile - convert newer JS to older JS syntax, or from JSX or TypeScript to plain JS. Typically with Babel or Webpack.

Using these tasks means that you improve the code quality and performance of your app, which improves the lives of your developer team and of end-users.


## Web apps without Node

The typical flow for Vue and React projects is to use Node to handle dependencies, a dev server and building static output (HTML, CSS and JS files).

But you can easily JavaScript project that follow the SPA approach of those, without Node. Then you don't need a build step. And hanks to ES Modules, you get to import your packages by UR Lin your JS files rather than loading them in an HTML file, so it keeps your dependencies close to where they re used.

This approach without Node is great for small projects with just a few pages, or if you want to add some forms or interactivity to an existing site without rewriting the whole thing with Node and all the associated overhead of structure and dependencies.

The examples below focus on one HTML file, one CSS file and one JS file. And you can load additional JS files such as for more components, if you need to.

### Vue

Here is a Vue-based application. Rather than loading Vue using a `script` tag in the HTML, rather the newer ES Module syntax is used. So within the JS script, there is an import of Vue from a CDN and the browser knows to download this and use it.

- [![MichaelCurrin - vue-frontend-quickstart](https://img.shields.io/static/v1?label=MichaelCurrin&message=vue-frontend-quickstart&color=blue&logo=github)](https://github.com/MichaelCurrin/vue-frontend-quickstart)

### React

And here is one for React.

- [![MichaelCurrin - react-frontend-quickstart](https://img.shields.io/static/v1?label=MichaelCurrin&message=rect-frontend-quickstart&color=blue&logo=github)](https://github.com/MichaelCurrin/react-frontend-quickstart)

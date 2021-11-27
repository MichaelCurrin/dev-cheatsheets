---
title: Script tag
description: Various ways to load and run JS in the browser using `script` tags
---


## Related

- [Modules][] in JS.
- [Defer execution][] of JS.

[Modules]: {% link cheatsheets/javascript/general/modules/index.md %}
[Defer execution]: {% link cheatsheets/javascript/browser/defer-execution.md %}


## Basic

### Inline

```html
<script>
  console.log("Hello, World")
</script>
```

Defer execution until content has loaded.

```html
<head>
  <script>
    window.onload = function () {
      const target = document.getElementById("app")
      target.innerText = "Hello, World")
      console.log("Hello, World")
    }
  </script>
</head>

<body>
  <div id="app"></div>
</body>
```

### Load module

Defer execution until content has loaded. Use defer attitude, or put the script tag at the bottom or the page.

```html
<head>
  <script defer src="/main.js"></script>
</head>

<body>
  <div id="app"></div>
</body>
```

```javascript
// main.js
const target = document.getElementById("app")
target.innerText = "Hello, World")
console.log("Hello, World")
```


## Library

### CDN

Load an external 3rd-party script from a CDN.

Such as [React](https://reactjs.org/docs/cdn-links.html)

```html
<head>
  <script defer src="https://unpkg.com/react@17/umd/react.production.min.js"></script>

  <script defer src="main.js"></script>
</head>

<body>
  <div id="app"></div>
</body>
```

### Load installed package

How to load a 3rd party library if installed using `npm install`.

You will have a `node_modules` directory and you need to copy the contents out of there at build time of your site.

e.g.

```sh
$ cp node_modules/package-name/module-name.js public/assets/
```

Then serve the `public` directory and load from it as:

```html
<head>
  <script defer src="/assets/module-name.js"></script>

  <script defer src="/assets/main.js"></script>
</head>
```

That can be error-prone, as you have to go an identify the exact script that you need from each package and you need to add a line for it in your HTML. Plus, if you make a mistake on the frontend, you won't know until you've loaded the page yourself.

### Use a bundler

An improvement on the above approach is using a bundler like Webpack, Vite, or ES Build. You'll get a single optimized JS file containing all your own code and all the 3rd-party packages you need. And there is only one line to add in the HTML.

```sh
$ npm run build
```

```html
<head>
  <script defer src="/assets/bundle.js"></script>
</head>
```

See my [Bundling quickstarts](https://github.com/MichaelCurrin/javascript-bundling-quickstarts/tree/master/quickstarts)


## ES Modules

If you want to use the `import` keyword to load a module by URL, then switch to ES Modules.

### Load module

```html
<head>
  <script defer src="/assets/main.js" type="module"></script>
</head>

<body>
  <div id="app"></div>
</body>
```

```javascript
// main.js
import { foo } from "https://dev.jspm.io/foo@17.0";

foo("abc")

const target = document.getElementById("app")
target.innerHtml = foo("abc")
```

See my [react-frontend-quickstart](https://github.com/MichaelCurrin/react-frontend-quickstart) for an example that acts as a demo and template.

### Inline

You can also run that inline. The downside is you can't use `defer` here on an inline tag, so defer another way with onload.

<head>
  <script type="module"></script>
    import { foo } from "https://dev.jspm.io/foo@17.0";

    window.onload = function () {
      foo("abc")

      const target = document.getElementById("app")
      target.innerHtml = foo("abc")
    }
  </script>
</head>

<body>
  <div id="app"></div>
</body>
```

Bundlers like Vite and ES Build also support use of `import`.

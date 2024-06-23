# Presite

> Presite is an alternative to static site generators like Gatsby, Next.js and Nuxt.js etc, the difference is that it uses Puppeteer to prerender websites instead of relying on server-side rendering.

## Benefits

- It works well on sites built around React or Vue. Add it as a step in your build flow and get the benefits.
- It will improve performance for the initial load for users.
- Makes SPAs visible to search engine crawlers (such as Google's crawler). As otherwise, crawlers have little or no visibilty of SPA sites as like do not like to render JS and they prefer to process a rendered DOM (from a static site or a server-side loading).

See the [Presite repo](https://github.com/egoist/presite) on GitHub for docs, including examples.


## How it works

As a build step

1. Presite uses Puppeteer to launch a headless browser instance of Chromium.
1. Presite will render the DOM for your SPA based on the contents of build directory e.g. `build` or `dist`.
1. Presite creates the HTML for the page and each additional page configured.
1. The HTML is stored in the `.presite` directory.

When a user visits the page:

1. Static HTML is loaded. User gets a flat but fixed HTML page initially. This happens without needing your app logic JS dependencies or processing all the logic in your JS to build the DOM. So this is ideal for a crawler.
1. Your JS app is loaded.
1. The static DOM is hydrated, so the page becomes interactive. This is useful for users. And a search engine crawler will probably not care about this part.


## Install

Make sure you have Chrome or Chromium installed.

```sh
$ sudo apt-get install chromium-browser
```

Install in your project as a dev dependency:

```sh
$ npm install -D presite
```

Or, install globally if you want to try it out on a few projects and not put it in your build flow yet.

```sh
$ npm install -g presite
```


## CLI

## Basic

```sh
$ presite BUILD_DIR
```

e.g.

```sh
$ presite build
$ presite dist
```

### Output

The default output directory is `.presite`.

You can do an override.

e.g.

```sh
$ presite BUILD_DIR -o static
```

Make sure to add the output directory to your `.gitignore` file.

## Configure

### JS package.json configs

Configure your `package.json` file to use `presite` for your build flow:

### React

```json
{
  "scripts": {
    "build": "react-scripts build",
    "render": "npm run build && presite build"
  }
}
```

### Vue

```json
{
  "scripts": {
    "build": "vue-cli-service build",
    "render": "yarn build && presite dist"
  }
}
```

## Multi-page sites

### Presite config

Create a configuration file to define your routes:

e.g.

- `presite.config.js`
    ```javascript
    module.exports = {
      entry: 'build/index.html',
      outDir: 'presite-output',
      routes: [
        '/',
        '/about',
        '/contact'
      ]
    };
    ```

### Routting

Remember to fix up your routing for a multi-page site, when linking between pages.

Make sure your React/Vue app does **not** use `/#/about` routing (with a hash), otherwise you'll got get a **single** HTML page generated and this will be rather limiting.

Rather make sure your app is setup to use `/about` as the style for URLs (without a hash). Then at the Presite build step a new file will be created for each page.

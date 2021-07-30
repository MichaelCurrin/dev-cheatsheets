# Presite

> Presite is an alternative to static site generators like Gatsby, Next.js and Nuxt.js etc, the difference is that it uses Puppeteer to prerender websites instead of relying on server-side rendering.

It works well on sites built around React and Vue, to improve performance for the initial load for users (as the HTMl is loaded without needing JS dependencies and then build the DOM) and also makes SPAs visible to search engine crawlers.

See [Presite](https://github.com/egoist/presite) on GitHub for docs including examples.


## Install

Install in your project as dev dependency.

```sh
$ npm install -D presite
```

Or install globally if you want to try it out on a few projects and not put it in your build flow yet.

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


## Examples

Remember to also fix up your routing for a multi-page site so you don't use `/#/about` hash routing. i.e. Make sure your app uses `/about` for URLs _before_ you run render, so that an HTML page is created for each path.

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

---
title: Prerender
description: Convert a Single-Page Application to a static site
---

This is intended for Node apps like those made with React or Vue.

As an alternative, there are some apps (Nuxt?) which render both as a static sites and SPAs at the same time, so you get the best of both.


## Tools

See also [The Top 22 Prerender Open Source Projects](https://awesomeopensource.com/projects/prerender)

### The Presite package

#### Install

```sh
$ npm i --save-dev presite
```

#### CLI

```sh
$ presite PATH

$ # e.g.
$ presite ./build
```

#### NPM

[presite](https://www.npmjs.com/package/presite)

See the link for config options.

> Presite is an alternative to static site generators like Gatsby, Next.js and Nuxt.js etc, the difference is that it uses Puppeteer to prerender websites instead of relying on server-side rendering.

#### GitHub

![egoist - presite](https://img.shields.io/static/v1?label=egoist&message=presite&color=blue&logo=github)](https://github.com/egoist/presite)
[![stars - presite](https://img.shields.io/github/stars/egoist/presite?style=social)](https://github.com/egoist/presite)
[![forks - presite](https://img.shields.io/github/forks/egoist/presite?style=social)](https://github.com/egoist/presite)

### The Prerender package

This is not actually make static assets. It just wraps your SPA with a Node server. But it is covered here anyway.

- Homepage: [prerender.io](https://prerender.io/)
- NPM: [prerender](https://www.npmjs.com/package/prerender)
    > Prerender is a node server that uses Headless Chrome to render HTML, screenshots, PDFs, and HAR files out of any web page. The Prerender server listens for an http request, takes the URL and loads it in Headless Chrome, waits for the page to finish loading by waiting for the network to be idle, and then returns your content.

#### GitHub

> Node server that uses Headless Chrome to render a javascript-rendered page as HTML. To be used in conjunction with prerender middleware.

[![prerender - prerender](https://img.shields.io/static/v1?label=prerender&message=prerender&color=blue&logo=github)](https://github.com/prerender/prerender)
[![stars - prerender](https://img.shields.io/github/stars/prerender/prerender?style=social)](https://github.com/prerender/prerender)
[![forks - prerender](https://img.shields.io/github/forks/prerender/prerender?style=social)](https://github.com/prerender/prerender)

## Configure script commands

Using `package.json`, you can set up a build and prerender commands and run both when you need to.

Here using `presite` and `react`.

```json
{
  "scripts": {
    "build": "react-scripts build",
    "prerender": "presite ./build",
    "build:prod": "npm run build && npm run prerender"
  }
}
```

Then run:

```sh
$ npm run build:prod
```


## About prerendering

### How it works

This converts a single `index.html` and routing made with JS into multiple flat HTML files.

First you need to build your app as static assets.

Typically with this.

```sh
$ npn run build
```

The process involves using a headless browser that renders the HTML and JS on all the roots and saves the output as an HTML page. This means less work for the client browser to do.

### Benefits

- Pages load for users even if JS is disabled.
- Not need to download and run JS scripts - whether yours, or libraries.
- Depending on how your site is setup, you might get a speed benefit.
- Search engines can view your site.

### Downsides

This turns your app into a _static_ site.

Dynamic behavior will not work anymore, unless you make additional work to do that.

Like a counter will be frozen and any data pulled in from an external source will be frozen and baked into the HTML as build time.

On the other hand, that might not matter to you like if you only need to update content at build time and not be live.

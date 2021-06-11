# Routing

This applies for multi-page Vue apps which use Vue Router.


## Summary

### Hash routes

The default is hash-based routing.

```
/#/about
```

### History routes

You can configure your site to use the browser's HTML5 _History_ API, to enable slash or path-based routing.

```javascript
import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  // ...
})
```

For Docsify, which is built on Vue, you configure the app as `routerMode: "history"`.


## More info

### Hash paths

Normally all the URLs on a Vue app are on a hash path.

- `/#/`
- `/#/about`

### Slash paths

Have your app configured to use path-based routes that use slash-based routing instead of hash-based.

This is done thanks to the HTML5 History API - Vue is able to to push changes to the URL's history.

This logic is set up in `src/router/index.js` using `createWebHistory` from `vue-router`. It's docstring says:

> Creates an HTML5 history. Most common history for single page applications.

### Fallback pages

Normally a bad path like this would still look like app outline, but with no content.

- `/#/not-a-path`

Now if you use slash-based routing and you send someone to a bad path like this, they'll see an ugly server error.

- `/not-a-path`

So docs recommend you to set up a fallback for 404 error to go to your homepage so that you root to the page. 

This important both for bad URLs in the app but _also_ more importantly, for any **external links** to your app. Since a link to `/about` will _not_ go through `index.html` unless you configure it to.

You need to do this in an Nginx config, or if use use Netlify config.

_But_, if you put your app through a static site renderer like `presite`, then you won't have this issue as each HTML page at the expected path will actually exist. So that fixes the issue for Docsify. I don't think Vue and React have this issue because your run the rendering against a static directory, but I need to check what happens to routes.

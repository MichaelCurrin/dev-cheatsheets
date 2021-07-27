# Webpack


## External depedencies

Webpack's default behavior is to include your dependencies (like React) in your output bundle JS file.

You can choose to leave that out, like this:

```javascript
module.exports = {

  external: {
    react: "React",
    "react-dom": "ReactDOM",
  },
```

And then add React using a script tag, so the browser can cache that. 

The downside is that this can get messy as you have to ensure each package defined in `package.json` is also defined as a `script` tag which loads a file from your own host. 

e.g. 

```html
<script src="assets/js/react.min.js"></script>
```

You probably do **not** want to reference React by a CDN URL, as then you have to ensure your React version is identical in `package.json` and your HTML.
  

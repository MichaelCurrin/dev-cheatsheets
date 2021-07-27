# Webpack


## TypeScript

In the case of bundling your externap packages, you have to still add support for plain `.js` files which are in your dependencies.

```javascript
module.exports = {
  resolve: {
    extensions: [".ts", ".tsx", ".js", ".jsx"]
  },
}
```


## Exclude external depedencies

Webpack's default behavior is to include your dependencies (like React) in your output bundle JS file.

You can choose to leave that out, like this. In this case, this is a TypeScript project and there are no plain JS files.

```javascript
module.exports = {
  extensions: [".ts", ".tsx"]

  externals: {
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
  
  
## Full

For TypeScript React project.

```javascript
module.exports = {
  mode: "production",
  target: 'node',
  // Enable sourcemaps for debugging webpack's output.
  devtool: "source-map",

  resolve: {
    extensions: [".ts", ".tsx", ".js", ".jsx"]
  },

  module: {
    rules: [
      {
        test: /\.ts(x?)$/,
        exclude: /node_modules/,
        use: [
          {
            loader: "ts-loader",
          },
        ],
      },
      // All output '.js' files will have any sourcemaps re-processed by 'source-map-loader'.
      {
        enforce: "pre",
        test: /\.js$/,
        loader: "source-map-loader",
      },
    ],
  },
  externals: {
    react: "React",
    "react-dom": "ReactDOM",
  },
};
```

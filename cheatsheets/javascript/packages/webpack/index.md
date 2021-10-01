# Webpack

See [Webpack CLI](https://webpack.js.org/api/cli/) docs.


## Usage

### Help

Using `webpack` or `webpack-cli` gives the result here.

```sh
$ npx webpack -h    
```

```
Usage: webpack [entries...] [options]
Alternative usage to run commands: webpack [command] [options]

The build tool for modern web applications.

Options:
  -c, --config <value...>                Provide path to a webpack configuration file e.g.
                                         ./webpack.config.js.
  --config-name <value...>               Name of the configuration to use.
  -m, --merge                            Merge two or more configurations using 'webpack-merge'.
...
```


## Initialize a project

```sh
$ webpack init
```

Note you'll be prompted to install a Webpack generatore package if you don't have it installed.

## Build

```sh
$ webpack
```

OR

```sh
$ webpack build
$ webpack bundle
```

## Set build name

See in the docs:

- [outputfilename](https://webpack.js.org/configuration/output/#outputfilename)
- [outputchunkfilename](https://webpack.js.org/configuration/output/#outputchunkfilename)

Sample for filename:

```javascript
module.exports = {
  //...
  output: {
    filename: 'bundle.js',
    // Using internal chunk id.
    filename: '[id].bundle.js', 
    // Using fiel hash.
    filename: '[contenthash].bundle.js', 
    // Multiple rules.
    filename: '[name].[contenthash].bundle.js',
    
    // Function.
    filename: (pathData) => {
      return pathData.chunk.name === 'main' ? '[name].js' : '[name]/[name].js';
    },
  },
};

module.exports = {
  //...
  output: {
  },
};
```

Sample for chunk name:

```javascript
module.exports = {
  output: {
    chunkFilename: '[id].js',
  },
};
```

## Set build input and output

### Default

- `package.json`
    ```json
    {
      "scripts": {
        "build": "webpack"
      }
    }
    ```

That implies:

```
./src/index.js -o dist
```

Note the dot-slash is required in the first path or you'll ge an error.

And works for `.tsx` input too.

### Custom input and output

Note that the outpath option is a directory - if you give it a filename, you'll end up with a directory named `index.js/`.

- `package.json`
    ```json
    {
      "scripts": {
        "build": "webpack ./src/main.js -o out/"
      }
    }
    ```
- `wepback.config.js`
    ```javascript
    const path = require("path");

    module.exports = {
      entry: "/src/index.ts",
      
      // ...
      
      output: {
        filename: "bundle.js",
        path: path.resolve(__dirname, "dist"),
      },
    };
    ```


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


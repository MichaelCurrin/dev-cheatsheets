# Subpath

How to deploy your React app so it can be hosted on a subpath.

Configure subpath so that React knows at build time to use a subpath in loading assets.


## Set URL

### Configure

Simply set up your `package.json` with `homepage`. 

That `homepage` field normally used for metadata when publishing to NPM registry, but it actually changes the app build flow here.

Examples:

- `package.json`
    ```json
    {
      "homepage": "https://example.com/my-subpath/"
    }
    ```
- `package.json`
    ```json
    {
      "homepage": "/my-subpath/"
    }
    ```

Either way, React will get the subpath portion and use it at build time, ignoring domain. 

Then build as usual:

```sh
$ yarn build
```

Message from the end is.

> The project was built assuming it is hosted at `/my-subpath/`.
>
> You can control this with the homepage field in your package.json.

### Environment variable

This is not so nice for local builds, as you have to make sure this is set somewhere in the shell or in a `.env` file or similar. But it does take preference over the `package.json` value set up above, so useful if you want to build to a dev environmente maybe where the subpath is different or not needed.

#### Subpath

Set `PUBLIC_URL` and do the build.

```sh
$ PUBLIC_URL=/my-subpath/ yarn build
```

> The project was built assuming it is hosted at `/my-subpath/`.

#### No subpath

Note that setting an empty string won't work so well as the `package.json` value will be used.

So set a forward slash.

```sh
$ PUBLIC_URL='/' yarn build
```

> The project was built assuming it is hosted at `/`.

#### Domain

Unlike setting `homepage` in `package.json`, the domain will be kept here.

You _can_ also use a full domain if you want that to appear in your compiled `index.html` file. 

```sh
$ PUBLIC_URL=https://example.com/my-subpath/ yarn build
```

> The project was built assuming it is hosted at `https://example.com/my-subpath/`.

But, that is more restrictive (you have to set the domain exactly and the site will break if the actual domain changes or the site is deployed somewhere else). 

I don't see the benefit to the absolute URL.


## How it works

The code is `public/index.html` looks like this, before subsitution.

```HTML
<link rel="icon" href="%PUBLIC_URL%/favicon.ico" />
```

We want it to be.

```HTML
<link rel="icon" href="/my-subpath/favicon.ico" />
```

## Deployed example

See this React-based web app:

- [michaelcurrin.github.io/react-quickstart/](https://michaelcurrin.github.io/react-quickstart/)

The assets like CSS, JS and images are looked up like this:

```
href="/react-quickstart/favicon.ico"
```

That is needed since `/favicon.io` would not be available.

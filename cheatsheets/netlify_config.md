# Netlify config

Netlify's config is `netlify.toml` and should be at the root of the repo. Indentation is two spaces.

## Resources

See Netlify's documentation on [File-based configuration](https://docs.netlify.com/configure-builds/file-based-configuration/).

## Basic

```toml
[build]
  command = "<CMD>"
  publish = "_site"

[build.environment]
  JEKYLL_ENV = "production"
```

Replace `<CMD>` with an appropriate command. 

It is a good idea to use a `make` command here, so that what you run locally to test a prod build and what you run on Netlify are the same. e.g. `make build-prod`.

For a simple Jekyll project, it could be `jekyll build`.

## Headers

```toml
[[headers]]
  for = "/*"
    [headers.values]
    Access-Control-Allow-Origin = "*"
```

Allow one or more specific domains:

```toml
    Access-Control-Allow-Origin = ["www.example.com", "test.com"]
```

# Netlify config


Netlify's config is `netlify.toml` and should be at the root of the repo. Indentation should be two spaces.

## Basic format

```toml
[build]
  command = "<CMD>"
  publish = "_site"

[build.environment]
  JEKYLL_ENV = "production"
```

### Build command

Replace `<CMD>` with an appropriate command above.

It is a good idea to use a `make` command here, so that what you run locally to test a prod build and what you run on Netlify are the same. 

e.g. 

```sh
make build-prod
```

For a simple Jekyll project, it could be this, using the trace flag for verbose errors.

```sh
jekyll build --trace
```

## Headers format

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

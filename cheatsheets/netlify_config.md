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

Where `<CMD>` might be `jekyll build` for a simple project or a `make` command.

## Headers

```toml
[[headers]]
  for = "/*"
    [headers.values]
    Access-Control-Allow-Origin = "*"
```

Allow one or more specific domains:

```toml
    Access-Control-Allow-Origin = "www.example.com", "test.com"
```

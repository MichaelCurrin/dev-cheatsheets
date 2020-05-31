# Netlify config

Netlify's config file is `netlify.toml`. It should be at the root of the repo. Indentation should be two spaces.


## Resources

See Netlify's docs:

- Configure builds
    - [Get started](https://docs.netlify.com/configure-builds/get-started/)
    - [File-based configuration](https://docs.netlify.com/configure-builds/file-based-configuration/)
    - [YAML and JSON file support](https://docs.netlify.com/configure-builds/file-based-configuration/#json-and-yaml-configuration-files)


## Basic Jekyll build


```toml
[build]
  command = "jekyll build"
  publish = "_site"

[build.environment]
  JEKYLL_ENV = "production"
```

### Build command

Replace `<CMD>` with an appropriate command above.

It is a good idea to use a `make` command here, so that what you run locally to test a prod build and what you run on Netlify are the same.

e.g.

```sh
$ make build-prod
```

For a simple Jekyll project, it could be this, using the trace flag for verbose errors.

```sh
$ jekyll build --trace
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
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTM1NzYwNjE1MF19
-->

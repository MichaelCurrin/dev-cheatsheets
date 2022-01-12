---
title: Netlify config
description: About Netlify's config file
---


Just push your main branch from your machine or edit on GitHub and a Netlify build will run using your config settings.

If you want more control than setting values in the Netlify UI, create a config file in your repo.


## Resources

- [Configure](https://michaelcurrin.github.io/code-cookbook/recipes/ci-cd/netlify/configure/) in my Netlify recipes, for samples for various tools like Jekyll and React.
- [File-based Configuration](https://docs.netlify.com/configure-builds/file-based-configuration/) in the Netlify docs.


## File

 - `netlify.toml`
 
It should be at the root of the repo. 

It is a TOML file. Indentation should be two spaces. 


## Fields

The minimum config two params under `[build]` as below.

- `command` - what shell command to run to build the app (dependencies are already installed when this runs).
- `publish` - which output directory to serve as a site. This directory is usually unversioned in git, for static site generators.


## Environment

If you have environment variables that are sensitive, put them directly in Netlify, under _Build & Deploy_ then _Environment_.

If they are safe to be visible in GitHub, add them like this, based on the docs.

- Prod only.
    ```toml
    [context.production]
      environment = { FOO = "bar", NODE_VERSION = "14.15.3" }
    ```

Here setting in Production and Deploy Preview, since it is _not_ enough to set it in only Production when I tested on a deploy preview.

```toml
[context.production]
  environment = { RUBY_VERSION = "2.7.0" }

[context.deploy-preview]
  environment = { RUBY_VERSION = "2.7.0" }
```

For sensitive environment variables, you might have to make an environment permission choice under _Sensitive variable policy_ - see [docs](https://docs.netlify.com/configure-builds/environment-variables/).
    
    
## Functions

Choose a directory to load serveless functions and background functions from.

Defaults to `netlify/functions` if not set.
  
Override example using `functions` directory at the root instead:

```toml
[build]
  functions = "functions"
```

I think the endpoint will be fixed.

- `/netlify/functions/my-api`


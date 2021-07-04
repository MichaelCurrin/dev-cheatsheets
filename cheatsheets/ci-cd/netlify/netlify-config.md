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

- `command` - what shell command to run to build the app (dependencies are already installed by then)
- `publish` - which output directory to serve as a site. This directory is usually unversioned in git.


## Environment

If you have environment variables that are sensitive, put them directly in Netlify.

If they are safe to be visible in GitHub, add them like this:

- Global
    ```toml
    [build]
      environment = { FOO = "bar", NODE_VERSION = "14.15.3" }
    ```
- Prod only.
    ```toml
    [context.production]
      environment = { FOO = "bar", NODE_VERSION = "14.15.3" }
    ```
    

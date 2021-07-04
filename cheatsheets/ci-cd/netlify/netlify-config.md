---
title: Netlify config
description: About Netlify's config file
---

See also [Configure](https://michaelcurrin.github.io/code-cookbook/recipes/ci-cd/netlify/configure/) in my Netlify recipes, for samples for site generators.

Just push your main branch from your machine or edit on GitHub and a Netlify build will run using your config settings.

If you want more control than setting values in the Netlify UI, create a config file in your repo.


## File

 - `netlify.toml`
 
It should be at the root of the repo. 

It is a TOML file. Indentation should be two spaces. 


## Fields

The minimum config two params under `[build]` as below.

- `command` - what shell command to run to build the app (dependencies are already installed by then)
- `publish` - which output directory to serve as a site. This directory is usually unversioned in git.

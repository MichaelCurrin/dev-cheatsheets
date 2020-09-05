---
title: GitHub Pages
---

## Gems on GH Pages
> Environment for standard GH Pages setup (without GH Actions)

See the [Dependency versions](https://pages.github.com/versions/) page for what gems GH Pages uses for builds.

You can enable these using `plugins` field of your config.

But GH Pages will ignore your `Gemfile` so you can't add other gems or to change a version.


## Jekyll versions

- `3.8.5` 
    - Up to the end of 2020, this was used on GH Pages. There is a ticket open on the Jekyll repo around upgrade to Jekyll 4 but that is a long way off.
- `3.9.0` 
    - This included a security release. 
    - It also means that the `kramdown-parser-gfm` gem has to be installed explicitly for local builds - so add it to your `Gemfile` file.
    - Sample
        ```ruby
        gem 'jekyll', '~> 3.9'
        gem 'kramdown-parser-gfm', '~> 1.1.0'
        ```
- `4.X` 
    - Jekyll 4 is available through GH Actions and Netlify, if you configure your build and choose your Jekyll version. 
    - Note that `kramdown-parser-gfm` is already included in the lockfile for a build of `4.1` at least, so you don't have to add this to your `Gemfile`. 
    - Sample
        ```ruby
        gem 'jekyll', '~> 4.1'
        ```

## Resources

- [GitHub Pages](https://pages.github.com/) home
- [Getting started](https://guides.github.com/features/pages/) guide on GitHub

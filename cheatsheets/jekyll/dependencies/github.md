# Install from GitHub

How to install a gem from GitHub URL rather than RubyGems.

Based on [How to install gems from git repositories](https://bundler.io/guides/git.html) doc.


## Why

This is useful for gems which you have not been published on RubyGems but are GitHub repos.

Or for a gem which is published, you might want to reference the latest code on the main branch in GitHub even though it hasn't been pushed to RubyGems. This has some risk but allows you to test out things. 

Or maybe target a feature branch.


## Requirements

The repo must have a `.gemspec` file at the root.


## Set up

Add the gem to your `Gemfile`:

```ruby
gem "GEMNAME", git: "GITHUB_URL"
```

Example:

```ruby
gem "rack", git: "https://github.com/rack/rack"
```

Install it.

```sh
$ bundle install
```

Then you can use the gem.


## Jekyll example

In Jekyll, this flow is not so useful for themes because you can just use Remote Themes Plugins on GH Pages. But if the theme has any dependencies, this won't get installed when the plugin runs on build, so it can be useful locally to install the theme using the GitHub method just to get the theme's dependencies. In my case this was useful for a theme that I used myself and is only on GitHub.

e.g.

[Gemfile](https://github.com/MichaelCurrin/dev-cheatsheets/blob/master/Gemfile)

```ruby
gem "fractal", git: "https://github.com/MichaelCurrin/fractal"
```

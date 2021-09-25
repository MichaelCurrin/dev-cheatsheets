# Install from GitHub

How to install a gem from GitHub URL rather than RubyGems. This is useful for plugins which you have not published on RubyGems. This is not so useful for themes because you can just use Remote Themes Plugins on GH Pages.

Based on [How to install gems from git repositories](https://bundler.io/guides/git.html) doc.


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

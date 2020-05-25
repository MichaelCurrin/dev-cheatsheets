# Themes


## Remote theme plugin

Allow installing of themes from Github.

This is specifically used on Github Pages for installing extra themes. But outside of Github Pages you can just these the standard `theme` field.

- [benbalter/jekyll-remote-theme](https://github.com/benbalter/jekyll-remote-theme)
  > Jekyll plugin for building Jekyll sites with any public GitHub-hosted theme



### 1. Add to config

Update your project's `_config.yaml`:

```yaml
plugins:
  - jekyll-remote-theme

remote_theme: foo/bar
```

Notes:

- Note the underscore in `remote_theme` - the install/serve will fail quietly if there is a dash.
- You can also add a tag in the theme. e.g. `foo/bar@v1.0.0` or `foo/bar@develop`.
- You do _not_ need to set the `theme` field. However, that might be better option if it works - since remote theme plugin runs on _every_ build which is not nice for large themes.


### 2. Add to Gemfile

Update your project's `Gemfile`.

```ruby
source 'https://rubygems.org'

gem 'bar', git: 'https://github.com/foo/bar'

group :jekyll_plugins do
  gem 'jekyll-remote-theme'
end
```

Based on [How to install gems from git repositories](https://bundler.io/guides/git.html) doc.

>  Specify that a gem should come from a git repository with a .gemspec at its root
>
> `gem 'rack', git: 'https://github.com/rack/rack'`

<!--stackedit_data:
eyJoaXN0b3J5IjpbMjA0Nzk2MDhdfQ==
-->
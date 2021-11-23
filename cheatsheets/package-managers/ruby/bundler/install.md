# Install gems

See [Subcommands][].

[Subcommands]: {% link cheatsheets/package-managers/ruby/bundler/subcommands/index.md %}


## Install from Gemfile

See also [gist](https://gist.github.com/MichaelCurrin/5c8c45a86bcf53d7b49a7763c02943b1) of install instructions.

```sh
$ bundle config set --local path vendor/bundle
$ bundle install
```

Old style - just for reference. Don't use this. Bundler docs mark this as **deprecated**.

```sh
$ bundle install --path vendor/bundle
$ # On later runs you can just run:
$ bundle install
```

## Install and add to Gemfile

```sh
$ bundle add GEM_NAME
```

```sh
$ bundle add jekyll
```

### Install in group

Install a gem and add it to a group.

Here we set `jekyll_plugins` as the group on the CLI, which becomes `:jekyll_plugins` in the `Gemfile`.

```sh
$ bundle add jekyll-optional-front-matter -g jekyll_plugins
```

Line appended:

```ruby
gem "jekyll-optional-front-matter", "~> 0.3.2", :group => :jekyll_plugins
```

But you may prefer to rewrite write it yourself like this:

```ruby
group :jekyll_plugins do
  gem 'jekyll-optional-front-matter', '~>	0.3.2'
  # Other plugins...
end
```

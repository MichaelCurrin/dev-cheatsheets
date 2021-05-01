# Installing gems


## install subcommand

See [install](https://bundler.io/man/bundle-install.1.html) command help.

Install all gems listed in `Gemfile`.

```sh
$ bundle install
$ # Equivalent but less clear.
$ bundle
```

Check paths of installed gems.

```sh
$ ls vendor/bundle/ruby/2.7.0/gems
```
```
addressable-2.7.0           jekyll-feed-0.15.1          minima-2.5.1
colorator-1.1.0             jekyll-sass-converter-1.5.2 pathutil-0.16.2
...
```

### Arguments

Summary of args I find useful.

| Arg                               | Description                                                                                                          |
| --------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `--quiet`                         | Do not print progress information to the standard output. Instead, Bundler will exit using a status code ($?).       |
| `--gemfile=PATH`                  | Specify path to a `Gemfile`. Defaults to the file in the current working directory.                                  |
| `--jobs=[<number>], -j[<number>]` | The maximum number of parallel download and install jobs. The default is 1. This seems to be popular in CI installs. |

Note that `--frozen`, `--clean` and `--deployment` flags are marked as deprecated in the CLI help.

Production install - you might see this used and it still works in Bundler 2, but it is deprecated.

```sh
$ bundle install --frozen --deployment
```


## clean subcommand

Remove unused gems from the vendor directory. i.e. Remove the gems and subdependencies not covered by Gemfile.

```sh
$ bundle clean
```

```sh
$ bundle clean --dry-run
```


## add subcommand

> Adds the specified gem to Gemfile (if valid) and run 'bundle install' in one step.

```sh
$ bundle add GEM VERSION
```

Example:

```sh
$ bundle add jekyll-optional-front-matter
```

Line appended to `Gemfile`:

```ruby
gem "jekyll-optional-front-matter", "~> 0.3.2"
```

Output:

```
Fetching gem metadata from https://rubygems.org/..........
...
Using jekyll-optional-front-matter 0.3.2
```

### Add to group

To put the plugin in a group:

```sh
$ bundle add jekyll-optional-front-matter -g jekyll_plugins
```

Line appended:

```ruby
gem "jekyll-optional-front-matter", "~> 0.3.2", :group => :jekyll_plugins
```

But you may prefer to write it yourself like this:

```ruby
group :jekyll_plugins do
  gem 'jekyll-optional-front-matter', '~>	0.3.2'
  # Other plugins...
end
```

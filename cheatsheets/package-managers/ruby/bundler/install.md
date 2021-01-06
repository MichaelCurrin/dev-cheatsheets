# Install


## `install`

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

Production install.

```sh
$ bundle install --frozen --deployment
```


### Arguments

Summary of args I find useful.

| Arg                               | Description                                                                                                                                                                                                        |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `--clean`                         | On finishing the installation Bundler is going to **remove** any gems not present in the current Gemfile(5). Don't worry, gems currently in use will not be removed.                                               |
| `--deployment`                    | In [deployment mode], Bundler will 'roll-out' the bundle for production or CI use. Please check carefully if you want to have this option enabled in your development environment. Requires a `Gemfile.lock` file. |
| `--frozen`                        | Do not allow the `Gemfile.lock` to be updated after this install. Exits non-zero if there are going to be changes to the `Gemfile.lock`.                                                                           |
| `--quiet`                         | Do not print progress information to the standard output. Instead, Bundler will exit using a status code ($?).                                                                                                     |
| `--jobs=[<number>], -j[<number>]` | The maximum number of parallel download and install jobs. The default is 1.                                                                                                                                        |

[deployment mode]: https://bundler.io/man/bundle-install.1.html#DEPLOYMENT-MODE


## add

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

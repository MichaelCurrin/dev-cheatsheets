# Gemfile


See [Gemfile](https://bundler.io/gemfile.html) in Bundler docs.


## Install gem

- `Gemfile`
    ```ruby
    gem 'foo'

    gem 'bar', '~> 2.5'
    ```

Then Bundler will use that.

```sh
$ bundle install
```


## Install from GitHub

```ruby
gem 'bar', git: 'https://github.com/foo/bar'
```


## Groups

See the [Groups][] cheatsheet,

[Groups]: {{ site.baseurl }}{% link cheatsheets/package-managers/ruby/bundler/groups.md %}

# Gemfile


See [Gemfile](https://bundler.io/gemfile.html) in Bundler docs.

Always start by setting `source` at the top as below.

Set up your `Gemfile` and run this to install with Bundler.

```sh
$ bundle config set --local path vendor/bundle
$ bundle install
```


## Location of gem

### Install gem from RubyGms

- `Gemfile`
    ```ruby
    source "https://rubygems.org"
    
    gem "foo"

    gem "bar", "~> 2.5"
    ```
    
### Install from GitHub

```ruby
source "https://rubygems.org"

gem "bar", git: "https://github.com/foo/bar"
```



## Groups

See the [Groups][] cheatsheet.


[Groups]: {{ site.baseurl }}{% link cheatsheets/package-managers/ruby/bundler/groups.md %}


## Mixed example

Using a mix of RubyGems and GitHub, group and ungrouped, and different locking levels.

source "https://rubygems.org"

```ruby
gem "jekyll", "~> 4.1"

gem "minima", "~> 2.5.1"

group :jekyll_plugins do
  gem "jekyll-sitemap", "~> 1.4"
  gem "jekyll-resize", git: "https://github.com/MichaelCurrin/jekyll-resize"
end
```

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

## Locking

### Why lock dependencies?

I would highly recommend **against** always pointing against the absolute **latest** version of a gem, especially a theme.

```ruby
gem "minima"
```

Files can move around or be renamed and a layout might disappear, so if you auto-deploy your site with the latest version of the theme (especially untagged, on master), then your site deploy might break or the deploy could work might the site will appear broken.

So rather lock like one of these:

```ruby
# Float major version.
gem "minima", "~> 2.5"

# Strict exact match.
gem "minima", "2.5.1"
```

I like the approach as above of locking to a compatible version `~> 2.5.1` to get bug fixes, as `2.5.1`, `2.5.2`, etc. but without possible breaking changes allowed like at `2.6`.

If you are more risk-tolerant, you can do `~> 2.5` which means that it will be `2.5.X` or `2.6.X` or `2.7.X` etc. but _not_ `3.X`.

```ruby
# Float minor verson.
gem "minima", "~> 2.5.1"
```

### Why use a lockfile?

I also like using a `Gemfile.lock` approach, when not using the standard GitHub Pages environment.

I might lock at `~> 2.5` to let the major version float to 2.6, 2.7 etc. But because I _have_ a `Gemfile.lock` file, it will be locked at say 2.6.2 unless I specifically upgrade it.

Locally, you could either of these:

- **Delete** the `Gemfile.lock` (if you have one), run `bundle install`, and then commit the `Gemfile`.
- Keep the existing `Gemfile.lock` and then **upgrade** with `bundle update`.

And then commit the `Gemfile.lock`.

That will get you the **latest** versions of _all_ gems and subdependencies in `vendor`. But still **within** the bounds of your Gemfile restrictions. And the installed gems are reflected in `Gemfile.lock`. So you can deploy with confidence that the if the locked gems work locally, they'll be installed _exactly_ the same on the remote and will work there too.

Using the approach of `~> 2.5` means you, you can easily upgrade anytime with one command. Without having to check what the next version is of a gem out and incrementing a number in your Gemfile from `2.5.1` to `2.6.0`. And without having to do that for each gem one at a time.

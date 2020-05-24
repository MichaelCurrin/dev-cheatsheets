# Jekyll plugins

Note that Jekyll plugins are just Ruby gems setup to work in a Jekyll project.


## Gemfile

How to setup a _Gemfile_, as a file managing dependencies.

### Install gems

If you using `Bundler`, you then run this at the top level of your project. This will read from the _Gemfile_.

My gist: https://gist.github.com/MichaelCurrin/5c8c45a86bcf53d7b49a7763c02943b1

```sh
bundle config --local path vendor/bundle
bundle install
```

Old style for reference - to be deprecated.

```sh
bundle install --path vendor/bundle
# On later runs you can just run:
bundle install
```


### Samples

Sample contents for a _Gemfile_.

Install a gem:

```ruby
gem 'foo'
gem 'foo', '~> x.y.z'
# Alternative
gem install foo -v x.y.z
```

Install a Jekyll plugin.

Single-line approach.

```ruby
gem 'foo', group: :jekyll_plugins
```

Or multi-line approach, good for multiple plugins.

```ruby
group :jekyll_plugins do
  gem 'foo'
  # Add more plugins here. Do NOT separate each line with comma.
end
```

Example of `Gemfile` for a Jekyll project below.

<!-- TODO add links to these plugins, using my other quick start repos -->

Note the Jekyll and a theme are alone and any Jekyll plugins go inside a group - this ensures they load at the correct order at build time.

```ruby
source 'https://rubygems.org'

gem 'jekyll', '~> 3.8.5'
gem 'minima'

group :jekyll_plugins do
  gem 'jekyll-feed'
  gem 'jekyll-sitemap'
end
```

Notes on the above:

- The source line is needed to prevent an error.
- Jekyll restriction will prevent getting Jekyll `4.0.0`.
- The group helps plugins to be loaded at the correct point when building the site.


Some additional plugins to try:

```ruby
  gem 'github-pages'
  gem 'jekyll-github-metadata'
```

Note that the _github-pages_ plugins includes the metadata one plus a lot of others, so you only need one of the above lines if you want to fetch Github metadata in your build.

### Resources

- Bundler
    - [Gemfile](https://bundler.io/v1.5/gemfile.html).
    - [Groups](https://bundler.io/v1.12/groups.html)
- [Jekyll Plugin Installation](https://jekyllrb.com/docs/plugins/installation/) doc.
- Plugins
    - Github Pages Plugin
        - [github/pages-gem](https://github.com/github/pages-gem) repo
        - [Github Pages](https://jekyllrb.com/docs/github-pages/) plugin in the Jekyll docs. This gives you a couple of Jekyll plugins and themes, which may be unnessary if you are running locally and only need to install one or two of those.
        - [Versions](https://pages.github.com/versions/) - Plugins supported by the `github-pages` plugin.
    - Github Metadata
        - [jekyll/github-metadata](https://github.com/jekyll/github-metadata) repo.
        - This is loaded by the Github Pages plugin. Sample output [here](https://github.com/jekyll/github-metadata/blob/master/docs/site.github.md) for `site.github` namespace.
- See a fuller Gemfile with comments in one of my repos [here](https://github.com/MichaelCurrin/jekyll-blog-demo/blob/master/Gemfile).

Why the `jekyll_plugins` group in the samples above? The docs say:

> Jekyll gives this particular group of gems in your Gemfile a different treatment. Any gem included in this group is loaded before Jekyll starts processing the rest of your source directory.

A gem included here will be activated even if its not explicitly listed under the plugins: key in your site’s config file.

## Plugins

### Local

Put plugins as `.rb` files in your `_plugins` directory.

Guides:
- [Your first plugin](https://jekyllrb.com/docs/plugins/your-first-plugin/)
- [Generators](https://jekyllrb.com/docs/plugins/generators/)

### External

If you are building on Github Pages, then in addition to a _Gemfile_ you must add plugins to your `_config.yml` file as such:

```yml
plugins:
  - jekyll-feed
  - jekyll-sitemap
```

Additional:

```yml
  - github-pages
  - jekyll-github-metadata
```

### Submodule

Add.

```sh
$ git submodule add git://github.com/foo/bar.git _plugins/foo
```

Update.

```sh
$ cd _plugins/bar
$ git pull origin master
```

## Remote themes

For themes not supported by Github Pages plugin, you can set a remote theme using a plugin.

- [benbalter/jekyll-remote-theme](https://github.com/benbalter/jekyll-remote-theme)

Add to `Gemfile`:

```ruby
gem "jekyll-remote-theme"
```

Add to `_config.yml`:

```yml
plugins:
  - jekyll-remote-theme

remote_theme: benbalter/retlab
```


<!--stackedit_data:
eyJoaXN0b3J5IjpbMTEyOTU5NTQwMSwtMTMyMzY1MTk2Myw2OT
I1Mjk4Niw4MDU3NTMzMDRdfQ==
-->
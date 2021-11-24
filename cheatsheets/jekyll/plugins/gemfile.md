# Gemfile

How to set up a _Gemfile_ as a file to plugins as gem dependencies.

## Related

- [Bundler][] cheatsheet - see _Gemfile_ and _Install_.

[Bundler]: {% link cheatsheets/package-managers/ruby/bundler/index.md %}


## Samples

Sample contents for a _Gemfile_.

Install a gem:

```ruby
gem 'foo'
gem 'foo', '~> x.y.z'
# Alternative
gem install foo -v x.y.z
```

Install a Jekyll plugin.

- Single-line approach.

    ```ruby
    gem 'foo', group: :jekyll_plugins
    ```
- Or multi-line approach, good for multiple plugins.

    ```ruby
    group :jekyll_plugins do
      gem 'foo'
      # Add more plugins here. Do NOT separate each line with comma.
    end
    ```

Example of `Gemfile` for a Jekyll project. See more info at [Gemfile recipe][].

[Gemfile recipe]: https://michaelcurrin.github.io/code-cookbook/recipes/jekyll/project-files/gemfile.html

Note the Jekyll and a theme are alone and any Jekyll plugins go inside a group - this ensures they load at the correct order at build time.

```ruby
source 'https://rubygems.org'

gem 'jekyll', '~> 3.9'

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

See also [Recommended Jekyll plugins][] page.

[Recommended Jekyll plugins]: {% link cheatsheets/jekyll/plugins/recommended.md %}


## Resources

- Bundler
    - [Gemfile](https://bundler.io/v1.5/gemfile.html).
    - [Groups](https://bundler.io/v1.12/groups.html)
- [Jekyll Plugin Installation](https://jekyllrb.com/docs/plugins/installation/) doc.
- Plugins
    - GitHub Pages Plugin
        - [github/pages-gem](https://github.com/github/pages-gem) repo
        - [GitHub Pages](https://jekyllrb.com/docs/github-pages/) plugin in the Jekyll docs. This gives you a couple of Jekyll plugins and themes, which may be unnecessary if you are running locally and only need to install one or two of those.
        - [Versions](https://pages.github.com/versions/) - Plugins supported by the `github-pages` plugin.
    - GitHub Metadata
        - [jekyll/github-metadata](https://github.com/jekyll/github-metadata) repo.
        - This is loaded by the GitHub Pages plugin. Sample output [here](https://github.com/jekyll/github-metadata/blob/master/docs/site.github.md) for `site.github` namespace.
- See a fuller Gemfile with comments in one of my repos [here](https://github.com/MichaelCurrin/jekyll-blog-demo/blob/master/Gemfile).

Why the `jekyll_plugins` group in the samples above? The docs say:

> Jekyll gives this particular group of gems in your Gemfile a different treatment. Any gem included in this group is loaded before Jekyll starts processing the rest of your source directory.

A gem included here will be activated even if its not explicitly listed under the plugins: key in your site’s config file.

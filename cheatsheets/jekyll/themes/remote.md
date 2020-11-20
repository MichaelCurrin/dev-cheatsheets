# Remote
> How to use a non-standard remote theme in a Jekyll site on GH Pages

## About the Remote Theme plugin

This allows installing of themes from GitHub.

This is specifically used on GitHub Pages for installing extra themes. But outside of GitHub Pages you can just these the standard `theme` field.

[![benbalter - jekyll-remote-theme](https://img.shields.io/static/v1?label=benbalter&message=jekyll-remote-theme&color=blue&logo=github)](https://github.com/benbalter/jekyll-remote-theme)

> Jekyll plugin for building Jekyll sites with any public GitHub-hosted theme


## Setup

For a live example, see [gh-pages](https://github.com/MichaelCurrin/jekyll-theme-quickstart/tree/gh-pages) branch of my Jekyll Theme Quickstart repo, which builds a site using the theme gem on the `master` branch.

### 1. Add to Gemfile

Update your project's dependencies.

- `Gemfile`
    ```ruby
    source "https://rubygems.org"

    group :jekyll_plugins do
      gem "jekyll-remote-theme", "0.4.2"
    end
    ```

You do **not** need to add the actual theme to your `Gemfile`. It will be downloaded by the plugin at build time, when running `jekyll build` or `jekyll serve`

### 2. Add to config

Update your project's config. Enable the plugin and pass it a repo as `USERNAME/REPO_NAME`.

- `_config.yml
    ```yaml
    plugins:
      - jekyll-remote-theme

    remote_theme: foo/bar
    ```

Notes:

- Note the **underscore** in `remote_theme` - the Jekyll commands will fail quietly if you incorrectly use a dash.
- For example, you can use:
    ```yaml
    remote_theme: MichaelCurrin/jekyll-theme-quickstart
    ```
- You can also add a tag in the theme. e.g. `foo/bar@v1.0.0` or `foo/bar@develop`.
- You do _not_ need to set the `theme` field. However, that might be better option if it works - since remote theme plugin runs on _every_ build which is not nice for large themes.

### 3. Install project gems

```sh
$ bundle install
```

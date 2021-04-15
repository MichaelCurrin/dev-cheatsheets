---
title: Structure
description: Understand the basic structure of a Jekyll project
---


## Files and directories

This project is setup to demonstrate use of the _Required_ file structure below.

If you are looking for a template project with more substantial content like multiple pages, see [jekyll-blog-demo](https://github.com/MichaelCurrin/jekyll-blog-demo). If you are looking for use of layouts, see this project - [themeless-jekyll-quickstart](https://github.com/MichaelCurrin/themeless-jekyll-quickstart).

### Required

A Jekyll site on GitHub Pages will render if the repo includes the following:

- Config YAML file:
    - `_config.yml`
- Homepage file
    - `index.md` OR
    - `index.html` OR
    - `README.md`

If neither of the **index** files exist, then the `README.md` will be used instead and is sufficient. It requires no YAML metadata so you can just use a standard README approach to content. Note that any content will appear on the site itself (like links to the site and link to the README which will attempt to download from the site if not ignored).

You can add additional pages, themes, layouts and so on to that setup.

### Optional files

You might be happy with a site that runs only on GitHub Pages - this could be fine for a simple site or for doc.

If you do want to install and run locally, you will need to add these to the project. See [MichaelCurrin/jekyll-blog-demo](https://github.com/MichaelCurrin/jekyll-blog-demo) for a complete example.

- `Gemfile`
    - GitHub Pages installs based on the config file and not the `Gemfile`, so this is optional if not running locally.
    - But one is recommended for local use if you have any gems (such as plugins and themes).
- `.gitignore`
    - To ignore the built `_site` directory.
    - Ignore the `vendor/` directory of gems.
    - And to ignore the `.bundle` directory if using `bundler` to install.


## Pages and frontmatter

For other pages (whether markdown or index), they will default to have **no** Jekyll processing. So you probably want to set YAML metadata.

The minimum would be _empty_ metadata.

```markdown
---
---
Markdown or HTML content goes here.

```

But metadata helps, at least to test a page title and make use of your own layout or a theme's layout. Depending on the theme, you can use `default` or `home` for your base layout.

```markdown
---
# YAML metadata goes here.
title: My homepage title
layout: default
---
Markdown or HTML content goes here.

```

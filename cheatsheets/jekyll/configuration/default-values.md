# Default values

If you don't set a value in your config, then the Jekyll default values below will be used.


## Jekyll config defaults

Copied from [Default Config](https://jekyllrb.com/docs/configuration/default/) in the Jekyll docs.

```yaml
# Where things are
source              : .
destination         : ./_site
collections_dir     : .
plugins_dir         : _plugins # takes an array of strings and loads plugins in that order
layouts_dir         : _layouts
data_dir            : _data
includes_dir        : _includes
sass:
  sass_dir: _sass
collections:
  posts:
    output          : true

# Handling Reading
safe                : false
include             : [".htaccess"]
exclude             : ["Gemfile", "Gemfile.lock", "node_modules", "vendor/bundle/", "vendor/cache/", "vendor/gems/", "vendor/ruby/"]
keep_files          : [".git", ".svn"]
encoding            : "utf-8"
markdown_ext        : "markdown,mkdown,mkdn,mkd,md"
strict_front_matter : false

# Filtering Content
show_drafts         : null
limit_posts         : 0
future              : false
unpublished         : false

# Plugins
whitelist           : []
plugins             : []

# Conversion
markdown            : kramdown
highlighter         : rouge
lsi                 : false
excerpt_separator   : "\n\n"
incremental         : false

# Serving
detach              : false
port                : 4000
host                : 127.0.0.1
baseurl             : "" # does not include hostname
show_dir_listing    : false

# Outputting
permalink           : date
paginate_path       : /page:num
timezone            : null

quiet               : false
verbose             : false
defaults            : []
```

See the [Strict rendering][] and [Markdown Options][] pages in this guide for info on the `liquid` and `kramdown` sections of the config.

[Strict rendering]: {% link cheatsheets/jekyll/configuration/strict-rendering.md %}
[Markdown Options]: {% link cheatsheets/jekyll/configuration/markdown-options.md %}

See the [Permalink][] page for more info on `permalink` field.

[Permalink]: {% link cheatsheets/jekyll/templating/permalinks.md %}

Set show directory listing to true if you want Jekyll server to list files and directories if an index file is absent. This is not so useful, as normally you'd have an index page otherwise the page is not styled. Also this only applies to local Jekyll. A use for this field would be when you are developing and you don't yet have a menu to access all your pages, so then you can explore all your pages in a directory view.

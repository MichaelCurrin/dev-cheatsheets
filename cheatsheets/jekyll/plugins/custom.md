---
title: Custom
description: How to write and use a Jekyll plugin within a repo
---

{% raw %}

This page covers generic syntax. See [Plugin](https://michaelcurrin.github.io/code-cookbook/recipes/jekyll/plugins/) recipes for more practical cases.

See [Plugins](https://jekyllrb.com/docs/plugins/) in the Jekyll docs for getting started writing an installing a plugin.


## Installation

To set up a plugin from below, copy the Ruby code to a `.rb` file in the `_plugins` directory. Then build or serve your site.

If you want to manage your plugin so you can share it across your projects and make it easy for others to install, then you can make a repo which is a gem that can be installed with `gem` or `bundle`. But this is not necessary.


## Tag
> Create custom Liquid tags

See [Tags](https://jekyllrb.com/docs/plugins/tags/) in the Jekyll docs.

This tag will output the time that the page was rendered, taking text and showing it.

```ruby
module Jekyll
  class MyFooTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "#{@text} #{Time.now}"
    end
  end
end

Liquid::Template.register_tag('foo', Jekyll::MyFooTag)
```

Usage. Note lack of quotes.

```liquid
{% foo Page rendered at %}

<!-- Possibly also? -->
{% foo text='Page rendered at' %}
```


## Filter
> Create custom Liquid filters

See [Filters](https://jekyllrb.com/docs/plugins/filters/) in the Jekyll docs.

```ruby
module Jekyll
  module MyFooFilter
    def foo(input)
      puts input
    end
  end
end

Liquid::Template.register_filter(Jekyll::MyFooFilter)
```

Usage:

```liquid
{{ 'hello' | foo }}
```


## Converter
> Change a markup language into another format

Jekyll uses a converter internally to process Markdown as HTML. You can support additional formats with your own converter.

See also [Markown Processors](https://jekyllrb.com/docs/configuration/markdown/) in the docs.

Based on [Converters](https://jekyllrb.com/docs/plugins/converters/) section of the Jekyll docs. This will process all files ending with `.myext`. In the `convert` method, we make all the text uppercase.

```ruby
module Jekyll
  class MyConverter < Converter
    safe true
    priority :low

    def matches(ext)
      ext =~ /^\.myext$/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      content.upcase
    end
  end
end
```


## Generator
> Create additional content on your site

Create pages, such as from YAML data files or fetched API data, rather than from markdown files.

Based on [Generators](https://jekyllrb.com/docs/plugins/generators/) section of the Jekyll docs.

> A generator is a subclass of Jekyll::Generator that defines a generate method, which receives an instance of Jekyll::Site. The return value of generate is ignored.

Here is the base structure of a generic plugin.

Make sure to set a `generate` method. 

You might want to set `initialize` if you are overriding the class's `initialize` method.

```ruby
module MyModule
  class MyGenerator < Jekyll::Generator

    def initialize(site, foo)
      super
      # Your logic
    end

    def generate(site)
      # Your logic
    end
  end
end
```

### Site variable 

The `site` variable available in the `generate` method is the same as `site` in a Jekyll Markdown or HTML page. 

So you read and update attributes, such as:

```ruby
site.pages
site.posts
site.config.description

See [Variables](https://jekyllrb.com/docs/variables/) in the docs.

### Read data file

If you want to read from a [Data File][] like `_data/foo.yml`, then in `generate` you can do:

[Data File]: https://jekyllrb.com/docs/datafiles/

```ruby
site.data.foo
# or
# site.data['foo']
```

Remember, you can also put JSON or CSV files in `_data` too and access them the same way.

### Read API data

Consider using a gem like Faraday to do a GET or a POST request against an API and then parse the JSON string to be data.

```ruby
require "json"
require "faraday"

# ...

resp = Faraday.post(
  @url,
  @payload.to_json,
  @headers,
)

if resp.status > 299
  puts resp.body
  raise "Request status: #{resp.status}"
end

json = JSON.parse resp.body
```

### Create page

If you want to set up a new page for Jekyll to render, set u a page like this, then append it to existing pages array with `<<`.

```ruby
new_page = Jekyll::Page.new(site, base, dir, name)
site.pages << new_page
```

And repeat with a _for_ loop for every page you want to add.

The page must be an instance of [Jekyll::Page][], [Jekyll::StaticFile][], or a class that derives from one of those.

What the docs _don't_ tell you is that you'll get an error if the page does _not_ yet exist. So for a _new_ page you'll want to use `PageWithoutAFile`.

From the Page class's initialize method in Jekyll codebase.

```ruby
    # Initialize a new Page.
    #
    # site - The Site object.
    # base - The String path to the source.
    # dir  - The String path between the source and the file.
    # name - The String filename of the file.
```

- Pass in `site` as is.
- From the docs, `base` can be `site.source`. Using `__dir__` can also work.
- Directory is output directory within the `_site` build. Use an empty string for top-level.
- Set name as `index.html` or whatever HTML, JSON or XML file you want to make.

The Jekyll [Feed][] plugin generates a single file so is a good simple plugin to look at for its source code.

Example from the plugin's [generator.rb][] module:

```ruby
PageWithoutAFile.new(@site, __dir__, "", file_path)
```

[Jekyll::Page]: https://github.com/jekyll/jekyll/blob/master/lib/jekyll/page.rb
[Jekyll::StaticFile]: https://github.com/jekyll/jekyll/blob/master/lib/jekyll/static_file.rb
[Feed]: https://github.com/jekyll/jekyll-feed
[generator.rb]: https://github.com/jekyll/jekyll-feed/blob/master/lib/jekyll-feed/generator.rb

{% endraw %}

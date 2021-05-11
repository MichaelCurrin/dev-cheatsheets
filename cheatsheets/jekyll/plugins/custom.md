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

Usage:

```liquid
{% foo Page rendered rendered at %}
<!-- Possibly also -->
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

Make sure to set a generate method. You only need to set `initialize` if you are overriding the class's `initialize` method.

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

{% endraw %}

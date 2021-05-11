---
title: Custom
description: How to create a Jekyll plugin
---

{% raw %}

This page covers generic syntax. See [Plugin](https://michaelcurrin.github.io/code-cookbook/recipes/jekyll/plugins/) recipes for more practical cases.

See [Plugins](https://jekyllrb.com/docs/plugins/) in the Jekyll docs for getting started writing an installing a plugin.

To set up a plugin, add a Ruby snippet from a below as `.rb` file in the `_plugins` directory. Then build or serve your site.


## Tag
> Create custom Liquid tags

See [Tags](https://jekyllrb.com/docs/plugins/tags/) in the Jekyll dos.


## Filter
> Create custom Liquid filters

See [Filters](https://jekyllrb.com/docs/plugins/filters/) in the Jekyll docs.

```ruby
module Jekyll
  module MyFilter
    def my_filter(input)
      puts input
    end
  end
end

Liquid::Template.register_filter(Jekyll::MyFilter)
```

Use like:

```liquid
{{ 'hello' | my_filter }}
```


## Converter
> Change a markup language into another format

Jekyll uses a converter internally to process Markdown as HTML. You can support additional formats with your own converter.

Based on [Converters](https://jekyllrb.com/docs/plugins/converters/) section of the Jekyll docs.

This will process all files ending with `.myext`. In the `convert` method, we make all the text uppercase.

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

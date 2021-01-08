# Variables

{% raw %}

## Page variables

For a page with path `demo/python/index.md`:

```liquid
{{ page | inspect }}
```

```ruby
{
  "layout"=>"page", 
  "title"=>"Python", 
  "content"=>"", 
  
  "dir"=>"/demo/python/", 
  "name"=>"index.md", 
  "path"=>"demo/python/index.md",
  
  "url"=>"/demo/python/"
} 
```

The value of `page.dir` is equivalent to:

```liquid
{{ page.path | remove: page.name }}
```

{% endraw %}

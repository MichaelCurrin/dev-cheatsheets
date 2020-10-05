---
title: Classes
---


## Instance variable

```ruby
class Foo
  def initialize(my_foo)
    @my_foo = my_foo
  end
  
  def bar
    puts @my_foo
  end
end

f = Foo.new
f.bar
```


## Method calls

```ruby
class Foo
  def baz
    puts 'Hello'
  end
  
  def bar
    self.baz
  end
end

f = Foo.new
f.bar
```


## Static class variable

```ruby
class Foo
  @@FOO = 'abc'
  
  def bar
    puts @@FOO
  end
end
```


## Attributes

```ruby
class Foo
  attr_accessor :debug
  
  def initialize(foo, bar, debug:)
     @debug = debug
  end
end
```

It lets you do things like:

```ruby
api = Foo.new(debug: true)

puts(api.debug)
# true

api.debug = false
puts(api.debug)
# false
```

That is similar to Python:

```
def initialize(foo, bar, **, debug=None):
```


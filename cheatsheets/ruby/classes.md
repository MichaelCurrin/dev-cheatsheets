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

# Classes


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

f = Foo.new(12)
f.bar
# 12
```


## Method calls

```ruby
class Foo
  def foo
    puts 'Hello'
  end

  def bar
    self.foo
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

### Getter

You need a getter otherwise the variable is not available outside the instance.

```ruby
class Foo
  def initialize(protein)
    @protein = protein
  end

  def protein
    @protein
  end

  def protein=(value)
    @protein = value
  end
end
```

```ruby
foo = Foo.new(21)

# Getter
foo.protein
# 21

# Setter
foo.protein = 100
```

### Attribute accessor

See guide - [How to Use attr_accessor, attr_writer & attr_reader](https://www.rubyguides.com/2018/11/attr_accessor/) and [Ruby OOP](https://www.rubyguides.com/ruby-tutorial/object-oriented-programming/).

Shorthand for the getter and setter.

```ruby
class Foo
  attr_accessor :protein

  def initialize(protein)
    @protein = protein
  end
end
```

There are three kinds:

- `attr_accessor` - read and write
- `attr_reader` - read only
- `attr_writer` - write only

Using a colon.

```ruby
class Foo
  attr_accessor :protein

  def initialize(foo, bar, protein:)
    @protein = protein
  end
end
```

If you use `attr_accessor :protein` you can do sets/gets on the field `@protein` automatically.

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

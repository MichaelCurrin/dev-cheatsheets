# Types

## Basic

```ruby
foo = "abc"

foo.class
# String

foo.is_a? String         # true
foo.kind_of? String      # true
foo.instance_of? String  # true
```

## Class

```ruby
class X < String
end

foo = X.new

foo.is_a? String         # true
foo.kind_of? String      # true
foo.instance_of? String  # false
foo.instance_of? X       # true
```

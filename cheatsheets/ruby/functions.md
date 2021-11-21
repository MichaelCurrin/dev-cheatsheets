# Functions


## Basic

```ruby
def foo(x)
  x*2
end

foo(5)
# 10
```


## Return tuple

```ruby
def foo
  return "abc", 2, true
end

a, b, c = foo()
a
# "abc"
b
# 2
c
# true
```

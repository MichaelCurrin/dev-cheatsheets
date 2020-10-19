# Looping


## Each

This is the typical Ruby way to do things.

See article - [Learn how to use Ruby each](https://mixandgo.com/learn/how-to-use-ruby-each)

### Array

One-line:

```ruby
my_array = [1, 2, 3]

my_array.each { |n| puts "Number: #{n}" }
```

Multi-line:

```ruby
my_array = [1, 2, 3]

my_array.each do |n|
  text = "Number:  #{n}"
  puts text
end
```

### Hash

```rubuy
my_hash = {min: 2, max: 5}

my_hash.each { |key, value| puts "k: #{key}, v: #{value}" }
```


## For

This is more like Python.

```ruby
my_array = [1, 2, 3]

for n in my_array do
  puts "Number: #{n}"
end
```

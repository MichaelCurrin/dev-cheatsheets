---
title: Looping
---


## Each

This is the typical Ruby way to do things.

One-line:

```ruby
[1, 2, 3].each { |n| puts "Number: #{n}" }
```

Multi-line:

```ruby
[1, 2, 3].each do |n|
  text = "Number:  #{n}"
  puts text
end
```


## For

This is more like Python.

```ruby
for n in [1, 2, 3] do
  puts "Number: #{n}"
end
```

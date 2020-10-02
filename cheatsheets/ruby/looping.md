---
title: Looping
---


## For

```ruby
for n in [1, 2, 3]
  puts n
end
```


## Each

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

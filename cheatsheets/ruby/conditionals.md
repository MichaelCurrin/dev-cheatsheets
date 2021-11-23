# Conditionals

## If statement

Using `if`, `elsif` and `else`.

```ruby
if CONDITIONAL
  EXPRESSION
elsif CONDITIONAL
  EXPRESSION
else
  EXPRESSION
end
```

e.g. From [Tutorials Point page](https://www.tutorialspoint.com/ruby/ruby_if_else.htm).

```ruby
x = 1

if x > 2
  puts "x is greater than 2"
elsif x <= 2 and x!=0
  puts "x is 1"
else
  puts "I can't guess the number"
end
```


## Unless

```ruby
x = 1 
unless x >= 2
   puts "x is less than 2"
 else
   puts "x is greater than 2"
end
```


## One-line if statement

```ruby
debug = 1

puts "Yes" if debug

# Same as `if not debug`
puts "Yes" unless debug
```


## Case

Use `case` as an alternative to `if else`. This is similar to `switch` in other languages, or `CASE` in SQL.

Based on [article](https://www.rubyguides.com/2015/10/ruby-case/).

### Case and range

```ruby
case capacity
when 0
  "You ran out of petrol."
when 1..20
  "The tank is almost empty. Quickly, find a petrol pump!"
when 21..70
  "You should be okay for now."
when 71..100
  "The tank is almost full."
else
  "Error: capacity has an invalid value (#{capacity})"
end
```

### Case and regex

```ruby
case serial_number
when /\AC/
  "Low risk"
when /\AL/
  "Medium risk"
when /\AX/
  "High risk"
else
  "Unknown risk"
end
```

### When not to use case

When, you have a one-to-one mapping, use this:

```ruby
SITES = {
  "europe"  => "http://eu.example.com",
  "africa" => "http://af.example.com"
}

SITES[country]
```

Rather than this:

```ruby
case country
when "europe"
  "http://eu.example.com"
when "africa"
  "http://af.example.com"
end
```

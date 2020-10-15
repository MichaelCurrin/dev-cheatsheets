# Versions

Setting gem versions a `Gemfile`.

## Format

```ruby
gem GEM_NAME
gem GEM_NAME MIN_OR_COMPAT
gem GEM_NAME, MIN, MAX
```

Note that double quotes is needed for arguments. Single quotes works but will be replaced by a `rufo`, the Ruby Formatter.


## Unpinned

```ruby
gem "minima"
```


## Pin

```ruby
gem "minima", "2.5.1"
```

## Min and max

```ruby
# Between range. Note upper bounded is needed.
gem "minima", ">= 2.5", "< 3"
```

## Compatible

Using a tilde.

Lock major only.

```ruby
gem "minima", "~> 2.5"
# Shorthand for >= 2.5, < 3
```

Lock major and minor.

```ruby
gem "minima", "~> 2.5.1"
# Shorthand for >= 2.5.1, < 2.6
```

Lock major but with minimum version.

```ruby
gem "minima", "~> 2.5", ">= 2.5.1"
```

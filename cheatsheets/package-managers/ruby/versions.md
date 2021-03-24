# Versions


## Version format

```
   1.2.3          # exact
 > 1.2.3          # minimum - not recommended
~> 1.2.3          # compatible
 >=1.2.3, <3.0.0  # range
```


## Shell command

```sh
gem install GEM_NAME --version 1.2.2
```

## Gemfile

Setting gem versions in a `Gemfile`.

### Format

```ruby
gem GEM_NAME
gem GEM_NAME MIN_OR_COMPAT
gem GEM_NAME, MIN, MAX
```

Note that double quotes are preferred arguments. Single quotes works but will be replaced by a `rufo`, the Ruby Formatter.

### Unpinned

```ruby
gem "minima"
```

### Pinned

```ruby
gem "minima", "2.5.1"
```

### Min and max

Between range. Note upper bounded is needed.

```ruby
gem "minima", ">= 2.5", "< 3"
```

### Compatible release

Use a tilde and angle brackets - `~> X.Y.Z`.

#### Lock major only

Let minor version float.

```ruby
gem "minima", "~> 2.5"
```

Shorthand for `>= 2.5, < 3`

i.e. `2.X` with a minimum of `2.5`.

You can also do `~> 2` which I think will be `>= 2, < 3`, which is the same but without `2.5` as a minimum. But it is safer to lock the minor version.

#### Lock major and minor

Let patch version float only.

```ruby
gem "minima", "~> 2.5.1"
```

Shorthand for `>= 2.5.1, < 2.6`

i.e. `2.5.X` with a minimum of `2.5.1`

#### Lock major, with a minimum patch version

This last one is not so common.

Compatible version but with minimum set - useful for avoiding vulnerabilties.

```ruby
gem "minima", "~> 2.5", ">= 2.5.1"
```

i.e. `2.X` with minimum of `2.5.1`.

Same as `">= 2.5.1", "< 3"`.

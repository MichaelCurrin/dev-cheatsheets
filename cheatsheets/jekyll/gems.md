---
title: Jekyll gems
---


## Check environment

```sh
$ gem env
```

```sh
$ bundle env
```


## List installed gems

```sh
$ bundle list
```
```
Gems included by the bundle:
  * addressable (2.7.0)
  * ...
```

Names of directories:

```sh
ls vendor/bundle/ruby/2.6.0/gems
```
```
addressable-2.7.0           i18n-0.9.5      ...
...
```

## Find gem locally

For a gem installed locally such as `minima` theme.

Show path:

```sh
$ bundle show minima
```
```
<PATH_TO_REPO>/vendor/bundle/ruby/2.6.0/gems/minima-2.5.1
```

Open VS Code in that directory. Use `open` to use your file browser.

```sh
code $(bundle show minima)
```


#### Gem command

See also [plugins](plugins.md) page.

Shell commands

```sh
$ gem install GEM_NAME
$ gem install --user-level GEM_NAME
$ gem upgrade GEM_NAME
```

Ruby command examples.

```ruby
gem 'minima'
gem 'jekyll', '>=3.5', '<5'
gem 'minima', '~> 2.5', '>= 2.5.1'
```

#### Bundler command

Gemfile should like this:

```ruby
gem 'foo'
gem 'bar', '~> 2.5'
```

Then Bundler will use that.

```sh
bundle install
```


## Install from Github


```ruby
gem 'bar', git: 'https://github.com/foo/bar'
```

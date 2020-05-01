# Jekyll gems cheatsheet

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

Fr a gem installed locally such as `minima` theme.

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

```ruby
gem install GEM_NAME
gem install --user GEM_NAME
gem upgrade GEM_NAME

# e.g.
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

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTExMDgwNTM2ODZdfQ==
-->

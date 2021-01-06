# Gemfile


See [Gemfile](https://bundler.io/gemfile.html) in Bundler docs.

## Groups

From [Groups](https://bundler.io/guides/groups.html) doc.

```ruby
# These gems are in the :default group
gem 'nokogiri'
gem 'sinatra'

gem 'wirble', group: :development

group :test do
  gem 'faker'
  gem 'rspec'
end

group :test, :development do
  gem 'capybara'
  gem 'rspec-rails'
end

gem 'cucumber', group: [:cucumber, :test]
```


```sh
$ bundle install --without test development
```


Or

```ruby
source 'https://rubygems.org'

gem 'rails', '3.2.2'
gem 'rack-cache', require: 'rack/cache'
gem 'nokogiri', '~> 1.4.2'

group :development do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
```

```sh
$ bundle install --without production
```

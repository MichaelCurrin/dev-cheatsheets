# Groups

Configure groups in `Gemfile` and then selectively install them.

Typically you'll use no group, test, developer or production.

And you'll select using `without`. I don't see the point of `with`, as a group will be installed by default even if not in `with`.


## Set up Gemfile

From [Groups](https://bundler.io/guides/groups.html) doc.

The examples are for setting up a `Gemfile`. You can also do this from the CLI - see [install][] cheatsheet.

[install]: {% link cheatsheets/package-managers/ruby/bundler/install.md %}

### Set up development and test gems

- `Gemfile`
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

### Set up production gems

- `Gemfile`
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


## Install from Gemfile

After setting up your Gemfile as in the section above, you can run use `bundle` with the `config` and `install` subcommands to install those groups.

### Configure

Target production and ungrouped gems only.

```sh
$ bundle config set --local without test development
```

Or target test, development and ungrouped gems only.

```sh
$ bundle config set --local without production
```

### Install

Then when you run

```sh
$ bundle install
```

You won't get the excluded groups.


## Config values

Example:

```sh
$ bundle config set --local without 'test'
```

Then see:

- `.bundle/config`
    ```yaml
    ---
    BUNDLE_WITHOUT: "test"
    ```


## Deprecated

Don't use the **deprecated** `--with` or `--without` flags, which was like this:

```sh
$ bundle install --without test development
```

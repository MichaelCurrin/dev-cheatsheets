---
title: Bundler commands
---

Bundler and bundle are equivalent. Even the gem's own recommendation for upgrading is: `bundle update bundler`.


## Commands

The commands of interest to me, grouped as related commands.

### Config

```sh
$ bundle config NAME [VALUE]     # Retrieve or set a configuration value
$ bundle config set NAME VALUE   # Sets the given value for the given key
$ bundle config list             # List out all configured settings
```

### Init

```sh
$ bundle init [OPTIONS]          # Generates a Gemfile into the current working directory
```

- `Gemfile` result.
    ```ruby
    # frozen_string_literal: true

    source "https://rubygems.org"

    git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

    # gem "rails"
    ```

Note the file is only readable, you change the permissions first.

```sh
$ chmod +w Gemfile
$ nano Gemfile
```
 
### Install

Make sure to configure Bundle first:

```sh
$ bundle config set --local path vendor/bundle
```

Then install gems.

```sh
$ bundle add GEM VERSION         # Add gem to Gemfile and run bundle install
$ bundle install [OPTIONS]       # Install the current environment to the system
```

### Update and clean

```sh
$ bundle outdated GEM [OPTIONS]  # List installed gems with newer versions available
$ bundle update [OPTIONS]        # Update the current environment
$ bundle pristine [GEMS...]      # Restores installed gems to pristine condition
```

### View gems

```sh
$ bundle open GEM                # Opens the source directory of the given bundled gem
$ bundle show GEM [OPTIONS]      # Shows all gems that are part of the bundle, or the path to a given gem
```


### Other

```sh
bundle version                 # Prints the bundler's version information
```

```sh
bundle console [GROUP]         # Opens an IRB session with the bundle pre-loaded
```

```sh
bundle exec [OPTIONS]          # Run the command in context of the bundle
```

```sh
bundle gem NAME [OPTIONS]      # Creates a skeleton for creating a rubygem
```

## Help

This is the full help for reference.
```sh
$ bundle -h
```
```
Bundler commands:
  bundle add GEM VERSION         # Add gem to Gemfile and run bundle install
  bundle binstubs GEM [OPTIONS]  # Install the binstubs of the listed gem
  bundle cache [OPTIONS]         # Locks and then caches all of the gems into vendor/cache
  bundle check [OPTIONS]         # Checks if the dependencies listed in Gemfile are satisfied by curren...
  bundle config NAME [VALUE]     # Retrieve or set a configuration value
  bundle config get NAME         # Returns the value for the given key
  bundle config help [COMMAND]   # Describe subcommands or one specific subcommand
  bundle config list             # List out all configured settings
  bundle config set NAME VALUE   # Sets the given value for the given key
  bundle config unset NAME       # Unsets the value for the given key
  bundle console [GROUP]         # Opens an IRB session with the bundle pre-loaded
  bundle doctor [OPTIONS]        # Checks the bundle for common problems
  bundle env                     # Print information about the environment Bundler is running under
  bundle exec [OPTIONS]          # Run the command in context of the bundle
  bundle gem NAME [OPTIONS]      # Creates a skeleton for creating a rubygem
  bundle help [COMMAND]          # Describe available commands or one specific command
  bundle info GEM [OPTIONS]      # Show information for the given gem
  bundle init [OPTIONS]          # Generates a Gemfile into the current working directory
  bundle install [OPTIONS]       # Install the current environment to the system
  bundle issue                   # Learn how to report an issue in Bundler
  bundle licenses                # Prints the license of all gems in the bundle
  bundle list                    # List all gems in the bundle
  bundle lock                    # Creates a lockfile without installing
  bundle open GEM                # Opens the source directory of the given bundled gem
  bundle outdated GEM [OPTIONS]  # List installed gems with newer versions available
  bundle platform [OPTIONS]      # Displays platform compatibility information
  bundle plugin                  # Manage the bundler plugins
  bundle plugin help [COMMAND]   # Describe subcommands or one specific subcommand
  bundle plugin install PLUGINS  # Install the plugin from the source
  bundle plugin list             # List the installed plugins and available commands
  bundle pristine [GEMS...]      # Restores installed gems to pristine condition
  bundle remove [GEM [GEM ...]]  # Removes gems from the Gemfile
  bundle show GEM [OPTIONS]      # Shows all gems that are part of the bundle, or the path to a given gem
  bundle update [OPTIONS]        # Update the current environment
  bundle version                 # Prints the bundler's version information
```
```
Options:
      [--no-color]                 # Disable colorization in output
  -r, [--retry=NUM]                # Specify the number of times you wish to attempt network commands
  -V, [--verbose], [--no-verbose]  # Enable verbose output mode
```

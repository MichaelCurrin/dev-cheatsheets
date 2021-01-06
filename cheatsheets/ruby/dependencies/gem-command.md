---
description: How to manage Ruby gems with the `gem` command
---
# Gem command


## Help

You get similar but much shorter output using `man gem`.

```sh
$ gem --help
```

<details>
<summary>Result</summary>

```
RubyGems is a sophisticated package manager for Ruby.  This is a
basic help message containing pointers to more information.

  Usage:
    gem -h/--help
    gem -v/--version
    gem command [arguments...] [options...]

  Examples:
    gem install rake
    gem list --local
    gem build package.gemspec
    gem help install

  Further help:
    gem help commands            list all 'gem' commands
    gem help examples            show some examples of usage
    gem help gem_dependencies    gem dependencies file guide
    gem help platforms           gem platforms guide
    gem help <COMMAND>           show help on COMMAND
                                   (e.g. 'gem help install')
    gem server                   present a web page at
                                 http://localhost:8808/
                                 with info about installed gems
  Further information:
    https://guides.rubygems.org
```

</details>


## Examples


```sh
gem help examples
```

<details>
<summary>Result</summary>

```
Some examples of 'gem' usage.

* Install 'rake', either from local directory or remote server:

    gem install rake

* Install 'rake', only from remote server:

    gem install rake --remote

* Install 'rake', but only version 0.3.1, even if dependencies
  are not met, and into a user-specific directory:

    gem install rake --version 0.3.1 --force --user-install

* List local gems whose name begins with 'D':

    gem list D

* List local and remote gems whose name contains 'log':

    gem search log --both

* List only remote gems whose name contains 'log':

    gem search log --remote

* Uninstall 'rake':

    gem uninstall rake

* Create a gem:

    See https://guides.rubygems.org/make-your-own-gem/

* See information about RubyGems:

    gem environment

* Update all gems on your system:

    gem update

* Update your local version of RubyGems

    gem update --system
```

</details>


## Show

```sh
$ gem list
$ gem list D # Filter to names starting with string.
```

```sh
$ bundle list
```

```sh
$ gem environment
```


## Manage gem

### Manage Bundler

```sh
$ gem install bundler --user-install
```

```sh
$ gem update bundler --user-install
```

### Install

Install gem in `/var/lib/gems`.

```sh
$ gem install GEM
```

I found I needed root access for `/var/lib/gems/2.7.0` directory - you can also change the permissions to allow anyone to write to it so `sudo` is not needed later.

Install in you user's `~/.gem` directory - just make sure to add it to your `PATH`.

```sh
$ gem install GEMNAME --user-install
```

Install target version.

```sh
gem install rake --version 0.3.1 --force --user-install
```

### Update

Update a target gem.

```sh
$ gem update GEMNAME
```

Update all gems.

```sh
$ gem update
```

Update the RubyGems gem only.

```sh
$ gem update --system
```

From the help:

```
--system [VERSION]           Update the RubyGems system software
```

You might want to use more control with `sudo` or `--user-install`.


### Remove

```sh
gem uninstall GEM
```

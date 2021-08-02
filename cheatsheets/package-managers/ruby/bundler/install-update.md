# Install and update Bundler

See also my [Install Ruby and Bundler](https://gist.github.com/MichaelCurrin/fb758aea4d35e03b9ed093afddf4e7ec) gist.

CLI commands using the `gem` command. Requires Ruby to be installed.

Note that you might already have Bundler installed with your system Ruby. You may want to upgrade root's Bundler, or install a user Bundler.


## Install

Install for current user. If you omit the flag, you might get a permissions error.

```sh
$ gem install bundler --user-install
```

Install as root user - at `/usr/bin/bundler`.

```sh
$ sudo gem install bundler 
```

Alternatively, set the permissions of this directory to be available for any user to install to, then install without `sudo`, as covered in the gist.


## Upgrade

Upgrade for user.

```sh
$ gem update bundler --user-install
```

Upgrade shared Bundler.

```sh
$ sudo gem update bundler
```

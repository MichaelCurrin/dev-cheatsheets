---
title: Gem path
description: Allow access to gems in the PATH variable
---

Gems are installed to the user location with:

```sh
$ gem install GEM --user-install
```

The directory install to will not be in the `PATH` variable.


## Update path

Here is how to set it, such as in `~/.bashrc`.

From [answer](https://stackoverflow.com/questions/14607193/installing-gem-or-updating-rubygems-fails-with-permissions-error)

This first checks that `ruby` and `gem` are installed and available.

```sh
if which ruby >/dev/null && which gem >/dev/null; then
   export PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
```

### Testing

This runs the library (`-r`) named `rubygems` and sends a command to it `puts Gem.user_dir` to print the user gem directory.

```sh
$ echo "$(ruby -r rubygems -e 'puts Gem.user_dir')/bin"
```
```
/Users/mcurrin/.gem/ruby/2.6.0/bin
```


---
description: Allow access to gems in the PATH variable
---
# Gem path


Gems are installed to the user location with:

```sh
$ gem install GEM --user-install
```

The directory install to will not be in the `PATH` variable.


## Update path

Here is how to set it, such as in `~/.bashrc`.

From [SO answer](https://stackoverflow.com/questions/14607193/installing-gem-or-updating-rubygems-fails-with-permissions-error).

This first checks that `ruby` and `gem` are installed and available, without printing. Note `[[` is not needed.

```sh
if which ruby >/dev/null && which gem >/dev/null; then
   export PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
```

### Breakdown

This runs the library (`-r`) named `rubygems` and sends a command to it `puts Gem.user_dir` to print the user gem directory as a full path.

```sh
$ echo "$(ruby -r rubygems -e 'puts Gem.user_dir')/bin"
```

Example:

```
/Users/mcurrin/.gem/ruby/2.6.0/bin
```

Test it:

```sh
$ gem install bundler --user-install

$ which bundler
/Users/mcurrin/.gem/ruby/2.6.0/bin/bundle
```

# Install and upgrade


## Directories

For macOS and Linux.

### Ruby

```
/usr/local/opt/ruby/bin/ruby
/usr/bin/ruby
```

### Bundler

```
/usr/local/opt/ruby/bin/bundler
/usr/bin/bundler
```

### System gems

```
/usr/local/opt/ruby/bin/
```

### User gems

When install with `gem install GEM --user-install`.

- Ruby 3:
    ```
    ~/.local/share/gem/ruby/3.X.0/bin
    ```
- Ruby 2: 
    ```
    ~/.gem/ruby/2.X.0/bin
    ```


## Install

See gist - [Install Ruby and Bundler](https://gist.github.com/fb758aea4d35e03b9ed093afddf4e7ec).

<script src="https://gist.github.com/MichaelCurrin/fb758aea4d35e03b9ed093afddf4e7ec.js"></script>


CLI help when installing Ruby 3 with Brew:

```
By default, binaries installed by gem will be placed into:
  /usr/local/lib/ruby/gems/3.0.0/bin

You may want to add this to your PATH.

ruby is keg-only, which means it was not symlinked into /usr/local,
because macOS already provides this software and installing another version in
parallel can cause all kinds of trouble.

If you need to have ruby first in your PATH, run:
  echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.zshrc

For compilers to find ruby you may need to set:
  export LDFLAGS="-L/usr/local/opt/ruby/lib"
  export CPPFLAGS="-I/usr/local/opt/ruby/include"

For pkg-config to find ruby you may need to set:
  export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
```


## Uninstall

### Remove gems

Delete custom gems installed at the user level.

```sh
$ rm -rf ~/.gem
```

Delete system-wide shared custom gems. This may need `sudo` if only root has access to modify it.

```sh
$ rm -rf /usr/local/lib/ruby/
```

That contains `gems/` and `site_ruby`.

### Remove Ruby

Remove the custom Ruby using your package manager. e.g.

```sh
$ brew uninstall ruby

$ sudo apt remove ruby
```

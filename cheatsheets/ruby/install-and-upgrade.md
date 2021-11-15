# Install and upgrade


## Directories

For macOS and Linux. The custom installs as are using a package manager like APT or Homebrew.

### Ruby

- Custom: `/usr/local/opt/ruby/bin/ruby`
- Built-in: `/usr/bin/ruby`

### Bundler

- Custom: `/usr/local/opt/ruby/bin/bundler`
- Built-in: `/usr/bin/bundler`

### System gems

When installing with `gem install GEM`.

```
/usr/local/opt/ruby/bin/
```

Or

```
/var/lib/gems/2.7.0
```

Get it dynamically with:

```sh
$ ruby -e -puts Gem.user_dir'
```

Or

```sh
$ gem environment gemdir 
```

### User gems

When installing with `gem install GEM --user-install`.

- Ruby 3:
    ```
    ~/.local/share/gem/ruby/3.X.0/bin
    ```
- Ruby 2: 
    ```
    ~/.gem/ruby/2.X.0/bin
    ```

If you install Bundler at the user level, it will be in there too.

Get it dynamically with:

```sh
$ ruby -e -puts Gem.user_dir'
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

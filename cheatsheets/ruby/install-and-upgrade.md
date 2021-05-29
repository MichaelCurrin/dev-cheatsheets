# Install and upgrade


## Install

See gist - [Install Ruby and Bundler](https://gist.github.com/fb758aea4d35e03b9ed093afddf4e7ec).

<script src="https://gist.github.com/MichaelCurrin/fb758aea4d35e03b9ed093afddf4e7ec.js"></script>


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

# Install

Install gem in `/var/lib/gems`.

```sh
$ gem install GEM_NAME
```

I found I needed root access for `/var/lib/gems/2.7.0` directory - you can also change the permissions to allow anyone to write to it so `sudo` is not needed later.

Install in you user's `~/.gem` directory - just make sure to add it to your `PATH`.

```sh
$ gem install rake --user-install
```

Install target version.

```sh
$ gem install rake --version 0.3.1 --force --user-install

$ gem install bundler -v ~> 2.1 --user-install
```

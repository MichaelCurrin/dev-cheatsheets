# Install

See also the Upgrade page.

## Shared install

Install in a directory shared by other users.

Install gem in `/var/lib/gems`:

```sh
$ gem install GEM_NAME
```

I found I needed root access for `/var/lib/gems/2.7.0` directory. i.e. run with `sudo`.

### Change permissions 

To avoid using `sudo`, you can also change the permissions to allow anyone to write to it so `sudo` is not needed later.

Give write access to all users:

```sh
$ sudo chmod +w /var/lib/gems
```

Change yourself to the directory owner.

```sh
$ sudo chown -R /var/lib/gems "$USER"
```

Now you can run this without `sudo`, which is safer.


```sh
$ gem install GEM_NAME
```


## User level install

This flow avoids `sudo` use altogether. Useful if you don't have access to `sudo`, don't want to use `sudo`, or want to isolate your user gems from those used by other users or the system gems.

Install in you user's gem directory.

```sh
$ gem install rake --user-install
```

Or install a target version.

```sh
$ gem install rake --version 0.3.1 --force --user-install
$ gem install bundler -v ~> 2.1 --user-install
```

Then make sure you have that directory in your `PATH`.

e.g. `~/.gem`

# User


## Current user

Using a built-in variable:

```console
$ echo $USER
mcurrin
```

Using a command:

```console
$ whoami
mcurrin
```


## Home directory

Using a built-in variable:

```console
$ echo $HOME
/Users/mcurrin
```

Using a tilde:

```console
$ echo ~
/Users/mcurrin
```

Literal if inside quotes:

```console
$ echo "~"
~
```


## Switch user

Change to a target user - enter their password.

```sh
$ su some-user
```

Or using sudo if you are in the sudoers file:

```sh
$ sudo su some-user
```

If you leave out the username, then you will change to `root`.

```sh
$ sudo su
```

Note this is dangerous as every command you will run as root and you could run a command accidentally without being asked for your password.

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


## Create user with sudo access

1. Create user.
    ```sh
    $ sudo adduser newuser
    ```
1. Add user to sudo group. The `-aG` option tells the system to append the user to the specified group. The `-a` option is only used with `G`.
    ```sh
    $ sudo usermod -aG sudo newuser
    ```
1. Verify group.
    ```sh
    $ groups newuser
    ```
1. Verify sudo access - become the user and then try a `sudo` command.
    ```sh
    $ su - newuser
    $ sudo ls /root
    ```
    

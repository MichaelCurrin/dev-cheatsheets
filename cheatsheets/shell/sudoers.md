---
description: How to act as the root user
---
# Sudoers


See the [Users][] cheatsheet for creating a user and adding them to the sudo group.

[Users]: {% link cheatsheets/shell/user.md %}


## View manpage

```sh
$ man sudoers
```

## Run as superuser

### Perform action as root

```sh
$ sudo COMMAND
```

### Change to root user

This is not recommended, as you might forget you are superuser. Also you won't have any alias like the interactive remove or copy which prevents overrides.

```sh
$ sudo su
```

### Configs

Read the sudoers config file. Do not edit this directly.

```sh
$ view /etc/sudoers
```

Edit using:

```sh
$ sudo visudo
```

Note if you want to give a user sudoers ability, do not add them to the file. Rather add them to sudo group as per [Users][] cheatsheet.

See also a directory for adding local content.

```sh
$ ls /etc/sudoers.d/
```


### Do admin actions without entering password

Configure your system to avoid entering your password every time your run sudo.

Add this as a row to sudoers config under this section. Replace `foo` with your target username so your user is affected.

```
foo ALL=(ALL) NOPASSWD:ALL
```

It might even work do to `%foo` if that references a group.

- [source](https://askubuntu.com/questions/21343/how-to-make-sudo-remember-my-password-and-how-to-add-an-application-to-startup)
- [source](https://askubuntu.com/questions/147241/execute-sudo-without-password)

Another [source](https://www.ubuntugeek.com/how-to-disable-password-prompts-in-ubuntu.html) says to edit the `admin` line instead - remember this will affect _all_ users on your machine with admin access, not just yours.

```
%admin ALL=(ALL) NOPASSWD: ALL
```

Note also `admin` and `sudo` groups are different. Admin users "may gain root privileges" and sudo users can "execute any command", according to notes in sudoers file.


## Remember sudo password for a set time

The machine will not prompt you again for your password for a time. More secure than the above as you stay your own user and don't have to enter your user's password on _every_ command, only once for multiple commands.

1. Edit sudoers file.
1. Set a default in seconds - here 5 minutes.
  ```
  Defaults        timestamp_timeout=300
  ```

[source](https://unix.stackexchange.com/questions/216891/how-do-i-make-sudo-remember-my-password-for-longer)

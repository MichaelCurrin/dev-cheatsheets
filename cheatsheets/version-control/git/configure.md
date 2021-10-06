---
description: How to configure git
---
# Configure

This is a general guide for _how_ to configure, not _what_ to configure. See link below for some fields.


## Related

- [Config fields]({{ site.baseurl }}{% link cheatsheets/version-control/git/config-fields.md %})


## Edit config directly

Open `~/.gitconfig` in you IDE.

e.g.

```sh
$ code ~/.gitconfig
```


## Edit config in shell editor

View or edit the config using `-e` for edit.

- Local config:
    ```sh
    $ git config -e
    ```
- Global config:
    ```sh
    $ git config -e --global
    ```


## Set specific details

How to use the CLI to set values.

- Local config:
    ```sh
    $ git config SECTION.SUBSECTION VALUE
    ```
- Global config
    ```sh
    $ git config --global SECTION.SUBSECTION VALUE
    ```

Example:

```sh
$ git config --global user.name 'Name Surname'
$ git config --global user.email nsurname@example.com
```

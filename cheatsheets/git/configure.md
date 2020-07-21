# Configure git


## Edit directly

Open `~/.gitconfig` in you IDE.


## Edit in terminal

View or edit the config using `-e` for edit.

```sh
$ git config -e
```

Or global config.

```sh
$ git config -e --global
```


## Set specific details

```sh
$ git config -e --global SECTION.SUBSECTION VALUE
```

Example:

```sh
$ git config -e --global user.name 'Name Surname'
$ git config -e --global user.email nsurname@example.com
```

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


## Merging

On running `git pull`:

```
warning: Pulling without specifying how to reconcile divergent branches is
discouraged. You can squelch this message by running one of the following
commands sometime before your next pull:

  git config pull.rebase false  # merge (the default strategy)
  git config pull.rebase true   # rebase
  git config pull.ff only       # fast-forward only
  
You can replace "git config" with "git config --global" to set a default
preference for all repositories. You can also pass --rebase, --no-rebase,
or --ff-only on the command line to override the configured default per
invocation.
```

Alternatively run:

```sh
$ git pull --rebase
```

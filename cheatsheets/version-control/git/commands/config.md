# config


## Usage

```sh
$ git config -h
```
```
usage: git config [<options>]
```


## Quick reference

Drop `--global` if you need to work on a repo-specific config.

```sh
$ git config --global -e 
$ git config --global user.email abc@example.com
$ git config --global user.email
abc@example.com
```


## Flags

### Config file location

#### Global

Mostly you'll the global option to edit `~/.gitconfig`.

```sh
$ git config --global
```

#### Local

If you want to edit the config of a git repo. This is the default option, so you can drop the flag.

```sh
$ git config --local
$ # OR
$ git config
```

#### System

I don't think I have needed this.

```sh
$ git config --system  
```
     
## The config file

Or use your editor to open the `~/.gitconfig` file. This makes it easy to read, add and update values.

Note that the config uses `TOML` format and tabs for indentation.


## Modes

### Edit config

Use the command-line.

```sh
$ git config -e # --edit
```

After you save the changes to the git config, the changes will be immediately available without restarting the terminal. As the config is read each `git` is called.

### Set a value

```sh
$ git config KEY VALUE
```

e.g.

```sh
$ git config --global user.email abc@example.com

$ git config --global --global alias.root "rev-parse --show-toplevel"
```

You can also use the `--add` command but I haven't seen this in use.

```sh
$ git config --add NAME VALUE
```

### View

Show all values.

```sh
$ git config -l # --list
```

Get one value.

```sh
$ $ git config --get NAME_REGEX
```

Note that if a value is not set for the local config, the global config will be used, so `--global` can actually be dropped here.

e.g.

```sh
$ git config --global user.email
abc@example.com
$ git config --global --get core.editor
nano
```

Get keys matching pattern.

```sh
$ git config --regexp PATTERN
```

e.g.

```sh
$ git config --regexp alias
alias.st status -s -b
alias.c commit
alias.br branch -a -v
alias.co checkout
...
```

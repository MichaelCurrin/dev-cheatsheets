---
title: tmux
description: Setup terminal windows and attach and detach from them
---

Useful for long-running tasks on a remote server.

For more help see [tmuxcheatsheet](https://tmuxcheatsheet.com/) site.

## Install

```sh
$ sudo apt  install tmux  
```

```sh
$ sudo snap install tmux
```

## Usage

### Help

```
tmux --help
usage: tmux [-2CluvV] [-c shell-command] [-f file] [-L socket-name]
            [-S socket-path] [command [flags]]
```

### Manpage

```
NAME
     tmux — terminal multiplexer

SYNOPSIS
     tmux [-2CluvV] [-c shell-command] [-f file] [-L socket-name] [-S socket-path] [command [flags]]

DESCRIPTION
     tmux is a terminal multiplexer: it enables a number of terminals to be created, accessed, and controlled from a single screen.  tmux may be detached from a screen
     and continue running in the background, then later reattached.
...
```


### Commands

Create an unnamed session.

```sh
$ tmux
```

Create a named session:

```sh
$ tmux new -s my-name
```

Then you can exit with `exit` or <kbd>CTRL</kbd>+<kbd>D</kbd> to end the session.

Or press this sequence to detach from the session and keep it running: <kbd>CTRL</kbd>+<kbd>B</kbd> and then <kbd>D</kbd>,

List sessions:

```sh
$ tmux ls
```

e.g. Unnamed session:

```
0: 1 windows (created Thu Apr 28 18:34:12 2022)
```

e.g. Named session:

```
test: 1 windows (created Thu Apr 28 18:26:26 2022)
```

From within Tmux, you can also list all sessions and switch between them: <kbd>CTRL</kbd>+<kbd>B</kbd> then <kbd>S</kbd>.

You can cycle through sessions with left and right brackets: <kbd>CTRL</kbd>+<kbd>B</kbd> then <kbd>)</kbd>.

You can attach to a running session:

```sh
$ tmux attach -t my-name
```

Kill a session:

```sh
$ mux kill-ses -t my-name
```


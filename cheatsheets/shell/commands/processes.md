# Processes
> Process-related commands

## View

### Process status


```sh
$ ps
```

```
NAME
     ps -- process status


     The ps utility displays a header line, followed by lines containing information about
     all of your processes that have controlling terminals.
```

e.g.

```sh
$ ps -aux
```

```
     -a      Display information about other users' processes as well as your own.  This will
             skip any processes which do not have a controlling terminal, unless the -x
             option is also specified.

     -u      Display the processes belonging to the specified usernames.

     -x      When displaying processes matched by other options, include processes which do
             not have a controlling terminal.  This is the opposite of the -X option.  If
             both -X and -x are specified in the same command, then ps will use the one which
             was specified last.

```

### Process tree

```sh
$ pstree
```

### Top

```
NAME
     top -- display and update sorted information about processes
```

```sh
$ top
```

### Interactive top

```
NAME
       htop - interactive process viewer
```

```sh
$ htop
```


## Find process

Find processes with names matching a pattern. Returns as multi-line output of IDs.


```sh
$ pgrep
```

```
     pgrep [-Lafilnoqvx] [-F pidfile] [-G gid] [-P ppid] [-U uid] [-d delim] [-g pgrp]
           [-t tty] [-u euid] pattern ...
```

e.g.

```sh
$ grep firefox
48402
```

```sh
$ pgrep apple
233
272
356
359
403
417
444
455
```


## Stop process

### Kill by ID

```sh
$ kill
```

```
NAME
     kill -- terminate or signal a process

SYNOPSIS
     kill [-s signal_name] pid ...
     kill -l [exit_status]
     kill -signal_name pid ...
     kill -signal_number pid ...
```


## Kill by name

```sh
$ pkill
```

```
NAME
     pgrep, pkill -- find or signal processes by name

     pkill [-signal] [-ILafilnovx] [-F pidfile] [-G gid] [-P ppid] [-U uid] [-g pgrp]
           [-t tty] [-u euid] pattern ...
```

e.g.

```sh
$ pkill -9 python
```

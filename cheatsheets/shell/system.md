---
title: System
---


## Uptime

```sh
$ uptime
```

```
19:47  up  7:55, 3 users, load averages: 3.32 3.82 4.10
```


## Usage

Breakdown of sorted sizes of files and directories at current level. Sorted by human-readable sizes and reversed.

```sh
$ du -hsc * | sort -hr
```


## Processes

### Process status

```
     ps -- process status
```

```sh
$ ps
```
```
PID TTY           TIME CMD
1031 ttys004    0:00.04 ...
1033 ttys004    0:00.19 -zsh
...
```

```sh
$ ps aux
```

### Process status tree

[man page](https://linux.die.net/man/1/pstree)

[Wikipedia](https://en.wikipedia.org/wiki/Pstree)
> pstree is a Linux command that shows the running processes as a tree. It is used as a more visual alternative to the ps command. The root of the tree is either init or the process with the given pid. It can also be installed in other Unix systems.

```
pstree [options] [pid or username]
```

```sh
$ pstree
```



Note your OS may have GUI for this. Like macOS Activity Manager.


### Processes list

```
     top -- display and update sorted information about processes
```

```sh
$ top
```

```
Processes: 445 total, 3 running, 442 sleeping, 2434 threads                                                                                                              19:57:10
Load Avg: 5.39, 5.14, 4.64  CPU usage: 24.94% user, 18.35% sys, 56.70% idle  SharedLibs: 209M resident, 57M data, 22M linkedit.
MemRegions: 131547 total, 3448M resident, 106M private, 3790M shared. PhysMem: 16G used (3558M wired), 97M unused.
VM: 2193G vsize, 1882M framework vsize, 0(0) swapins, 0(0) swapouts. Networks: packets: 3646305/2277M in, 2200838/1228M out. Disks: 1305417/11G read, 945445/8111M written.

PID    COMMAND      %CPU TIME     #TH   #WQ  #PORT MEM    PURG   CMPRS  PGRP  PPID  STATE    BOOSTS        %CPU_ME %CPU_OTHRS UID        FAULTS    COW      MSGSENT    MSGRECV
20854  zoom.us      50.0 33:28.26 63    7    1393+ 312M-  15M-   68M    20854 1     sleeping *0[422]       1.06707 0.23404    1523680666 31247352+ 1416     10628072+  5334433+
956    iTerm2       33.3 00:27.45 12    9    387+  449M+  108M-  32M-   956   1     sleeping *0[1039]      0.01776 2.43655    1523680666 1201646+  1803     144076+    41923+
```

More colorful and sortable and lets you action on items.

```
       htop - interactive process viewer
```

Install first.

```sh
$ htop
```

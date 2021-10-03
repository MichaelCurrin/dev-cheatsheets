---
title: Level

description: Set permissions access level
---


## Access bits

SUUUGGGOOO

S is special.

Symbol | Meaning
---   | ---
`-` | file
`d` | directory
`l` | link

The others are one of `r`, `w`, `x`, or `-`.

U is for user who is the owner.

G is for user group.

O is for other users.


## Levels

Number | Octet
--- | ---
0 | `---`
1 | `--x`
2 | `-w-`
3 | `-wx`
4 | `r--`
5 | `r-x`
6 | `rw-`
7 | `rwx`


## Commands

```sh
$ chmod VALUE PATH
```

## Modify

### All

This will update for all users.

Add access for `r`, `w`, or `x`.

```sh
$ chmod +x
```

Remove.

```sh
$ chmod -x
```

### Target

Restrict to owner, group, or other.

```sh
$ chmod u+x
```

### Set number

Read, write, and execute permissions for everyone.

```sh
$ chmod 777
```

Read, write, and execute permissions for the user only.

```sh
$ chmod 700
```
Write and execute permission for the user, write for the group, and read, write, and execute for the users.

```sh
$ chmod 327 
```

### Set bits

```sh
$ chmod USERS=LEVEL
$ chmod USERS=LEVEL,USERS=LEVEL
```

e.g.

```sh
$ chmod ug=rw,o=r,a+X
```


## Recursive

If you set permissions on a directory, it will not apply to files and directories inside it. Unless you use the recursive flag.

e.g.

```sh
$ chmod -R VALUE PATH
```

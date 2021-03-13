# chmod

See [Tutorial on chmod](https://www.howtogeek.com/437958/how-to-use-the-chmod-command-on-linux/) on How to Geek site.


## Help

### Usage

Note that the flags (options) must come **before** position parameters.

```sh
$ man chmod 
```

Linux:

```
chmod - change file mode bits  

chmod [OPTION]... MODE[,MODE]... FILE...
chmod [OPTION]... OCTAL-MODE FILE...
chmod [OPTION]... --reference=RFILE FILE...  
```

macOS:

```
NAME
     chmod -- change file modes or Access Control Lists

SYNOPSIS
     chmod [-fv] [-R [-H | -L | -P]] mode file ...
     chmod [-fv] [-R [-H | -L | -P]] [-a | +a | =a] ACE file ...
     chmod [-fhv] [-R [-H | -L | -P]] [-E] file ...
     chmod [-fhv] [-R [-H | -L | -P]] [-C] file ...
     chmod [-fhv] [-R [-H | -L | -P]] [-N] file ...
```

#### Mode

You can give a mode like this. It will only add (or take away) where relevant.

```sh
$ chmod +x PATH  # Add for all.
$ chmod -x PATH  # Remove for owner.

$ chmod +xw PATH # Add two for owner.

$ chmod o+x      # Add for other.
$ chmod g+x      # Add for group.
```

#### Octal mode

Use an octal mask which will _overwrite_ all 3 octets.

```sh
$ chmod 644 PATH
$ chmod 755 PATH 
```

### Flags

Note that flags are different on Linux and macOS. Only Linux supports the longer form of a flag.

- `-v, --verbose` - Output a diagnostic for every file processed. Useful for recursive use.
- `-c` - Like verbose, but only show if a file was changed.
- `-R, --recursive` - Change files and directories recursively 

### Manpage

- [linux die](https://linux.die.net/man/1/chmod)
- [man 7](https://www.man7.org/linux/man-pages/man1/chmod.1.html)
- [command line linux](https://www.commandlinux.com/man-page/man1/chmod.1.html)

## Meanings

### Target

A combination of the letters `ugoa` controls which users' access to the file will be changed: 

Control | Description
---     | ---
`u`     | the user who owns it
`g`     | other users in the file's group
`o`     | other users not in the file's group (`o`), 
`a`     | all users

If none of these are given, the effect is as if `a` were given. But bits that are set in the umask are not affected.

### Access types

These appear for permissions when using `ls -l`.

e.g.

```
-rw-------
lrwxr-xr-x
drwxr-xr-x
```

Symbol | Description
---    | ---
`r`    | Read.
`w`    | Write.
`x`    | Execute.

Other symbols:

Symbol | Description
---    | ---
`d`    | Directory - appears for directories.
`l`    | Symbolic link.
`t`    | Sticky 
`s`    | The set-user-ID-on-execution and set-group-ID-on-execution bits.
`+`    | Access control.

Access control is visible with `ls -le`

e.g.

```
drwxr-xr-x+
```

### Bits

```
rwx
```

Binary:

```
101
```

Number:

```
= 4*1 + 2*0 + 1*1
= 5
```

### Octal numbers for a single level

Increasing levels of the octal number and what is means. 

Permissions | Binary number | Octal number | Description
---    | ---      | --- | ---
`r--`  | `100`    | `4` | Read only.
`r-x`  | `101`    | `5` | Read and execute.
`rw-`  | `110`    | `6` | Read and write.
`rwx`  | `111`    | `7` | Read, write and execute.

- The above can be applied to any of the levels - `u`, `g` and `o`.
- The octal number ranges from `0` to `7` but still uses base 10 so just think of it as plain number with a limited range.

### Permissions across levels

Some common use of 3 octal values and meanings. Using three octal numbers.

Permissions | Description
---   | ---
`444` | Read only for everyone.
`544` | Only owner can write.
`644` | Only owner can execute (but not wite)
`766` | Writable for everyone. But only owner can execute.
`755` | Executable for everyone. But only owner can write.
```


## Examples

### Executable file

Add permissions:

```sh
$ chmod +x script.sh
```

Remove permissions:

```sh
$ chmod -x script.sh
```

### Allow non-owners to write to directory

Give "other" users who are not owners access to write to a directory.

```sh
$ chmod o+w /some/dir
```

### Restore

Reset to the permissions set when making a new item.

### Reset file

```sh
$ chmod 544 file
```

Resulting bits:

```
-rw-r--r--
```

### Reset directory

Like file, except executable bit for all levels.

```sh
$ chmod 755 directory
```

Resulting bits:

```
drwxr-xr-x
```

### Reset all levels

Note if you also want to update the contents of a directory, you need to use the recursive flag. But be careful to not run this against all files in the directory.

Recommended - use the `find` command against files and then against directories.

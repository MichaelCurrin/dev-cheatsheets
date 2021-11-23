# Echo


## Usage

```sh
echo Hello, world!

echo 'Hello, world!'

TARGET='world'
echo "Hello, $TARGET!"
echo "Hello, ${TARGET}!"
```

### Write to file

```sh
echo 'foo' > bar.txt
```

Write without trailing newline character.

```shell
echo -n 'foo' > bar.txt
```

```sh
echo 'foo
bar
baz' > bar.txt
```



## Man page

On macOS

```
$ man echo
```
```
SYNOPSIS
     echo [-n] [string ...]

DESCRIPTION
     The echo utility writes any specified operands, separated by single blank (` ') characters and followed by a newline (`\n') character, to the standard out-
     put.

     The following option is available:

     -n    Do not print the trailing newline character.  This may also be achieved by appending `\c' to the end of the string, as is done by iBCS2 compatible
           systems.  Note that this option as well as the effect of `\c' are implementation-defined in IEEE Std 1003.1-2001 (``POSIX.1'') as amended by Cor.
           1-2002.  Applications aiming for maximum portability are strongly encouraged to use printf(1) to suppress the newline character.

     Some shells may provide a builtin echo command which is similar or identical to this utility.  Most notably, the builtin echo in sh(1) does not accept the
     -n option.  Consult the builtin(1) manual page.
```

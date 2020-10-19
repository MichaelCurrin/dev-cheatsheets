# Echo

## Echo

```sh
echo Hello, world!

echo 'Hello, world!'

TARGET='world'
echo "Hello, $TARGET!"
echo "Hello, ${TARGET}!"
```

Implies a newline character at the end.

```sh
echo 'foo' > bar.txt
```


```sh
echo 'foo
bar
baz' > bar.txt
```

Write without trailing newline character.

```shell
echo -n 'foo' > bar.txt
```


### Man page

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

## Printf

More advanced form of `echo`.

## Man page

On macOS.
```sh
$ man printf
```

```
NAME
     printf -- formatted output

SYNOPSIS
     printf format [arguments ...]

DESCRIPTION
     The printf utility formats and prints its arguments, after the first, under control of the format.  The format is a character string which contains three
     types of objects: plain characters, which are simply copied to standard output, character escape sequences which are converted and copied to the standard
     output, and format specifications, each of which causes printing of the next successive argument.

     The arguments after the first are treated as strings if the corresponding format is either c, b or s; otherwise it is evaluated as a C constant, with the
     following extensions:

           o   A leading plus or minus sign is allowed.
           o   If the leading character is a single or double quote, the value is the character code of the next character.

     The format string is reused as often as necessary to satisfy the arguments.  Any extra format specifications are evaluated with zero or the null string.

     Character escape sequences are in backslash notation as defined in the ANSI X3.159-1989 (``ANSI C89''), with extensions.  The characters and their meanings
     are as follows:

           \a      Write a <bell> character.
           \b      Write a <backspace> character.
           \c      Ignore remaining characters in this string.
           \f      Write a <form-feed> character.
           \n      Write a <new-line> character.
           \r      Write a <carriage return> character.
           \t      Write a <tab> character.
           \v      Write a <vertical tab> character.
           \'      Write a <single quote> character.
           \\      Write a backslash character.
           \num    Write a byte whose value is the 1-, 2-, or 3-digit octal number num.  Multibyte characters can be constructed using multiple \num sequences.
```

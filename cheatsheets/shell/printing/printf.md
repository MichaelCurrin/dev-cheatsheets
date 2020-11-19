# printf


A more advanced form of `echo`.


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

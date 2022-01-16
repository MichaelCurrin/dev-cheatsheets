---
title: wc
description: Command to count contents size of text or files

---

Count number of characters, lines, and words. or


he default is to show all 3 counts.


## Options

Specify just one count.

Flag | Description
---  | ---
`-c` | Byte count only
`-l` | Line count only
`-m` | Character count only
`-w` | Word count only

It seems like byte and character counts are the same if not using multibyte characters like for unicode symbols.

When running against PNGs, I got an error on the character counts but still got a result.

```console
$ wc -m sample-cheatsheets.png
wc: sample-cheatsheets.png: Illegal byte sequence
  202331 sample-cheatsheets.png
```


## Files

This can be useful on file contents. Use it in file paths. You get an error on directories.

```sh
$ wc [OPTIONS] [PATHS]
```

e.g.

Single file:

```console
$ wc README.md
      84     419    3918 README.md
```

Multiple files:

```console
$ wc docs/*
       8      16     191 docs/README.md
      10      52     352 docs/deploy.md
       6      17     185 docs/development.md
      31      55     438 docs/installation.md
       9      13      96 docs/usage.md
      64     153    1262 total
```
  
## Related

See [Count files in repo][]

[Count files in repo]: {% link cheatsheets/version-control/git/count-files-in-repo.md %}


## Help

From macOS:

```console
$ man wc
Count number of characters, lines, and words.
WC(1)                     BSD General Commands Manual                    WC(1)

NAME
     wc -- word, line, character, and byte count

SYNOPSIS
     wc [-clmw] [file ...]

DESCRIPTION
     The wc utility displays the number of lines, words, and bytes contained in each input file, or standard input (if no file is specified) to the standard
     output.  A line is defined as a string of characters delimited by a <newline> character.  Characters beyond the final <newline> character will not be
     included in the line count.

     A word is defined as a string of characters delimited by white space characters.  White space characters are the set of characters for which the
     iswspace(3) function returns true.  If more than one input file is specified, a line of cumulative counts for all the files is displayed on a separate line
     after the output for the last file.

     The following options are available:

     -c      The number of bytes in each input file is written to the standard output.  This will cancel out any prior usage of the -m option.

     -l      The number of lines in each input file is written to the standard output.

     -m      The number of characters in each input file is written to the standard output.  If the current locale does not support multibyte characters, this
             is equivalent to the -c option.  This will cancel out any prior usage of the -c option.

     -w      The number of words in each input file is written to the standard output.

     When an option is specified, wc only reports the information requested by that option.  The order of output always takes the form of line, word, byte, and
     file name.  The default action is equivalent to specifying the -c, -l and -w options.

     If no files are specified, the standard input is used and no file name is displayed.  The prompt will accept input until receiving EOF, or [^D] in most
     environments.
```

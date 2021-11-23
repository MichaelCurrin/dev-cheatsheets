# Man page

```sh
$ man grep
```

Output on macOS:

<details>
<summary>Man output</summary>

<pre>
GREP(1)                   BSD General Commands Manual                  GREP(1)

NAME
     grep, egrep, fgrep, zgrep, zegrep, zfgrep -- file pattern searcher

SYNOPSIS
     grep [-abcdDEFGHhIiJLlmnOopqRSsUVvwxZ] [-A num] [-B num] [-C[num]] [-e pattern] [-f file]
          [--binary-files=value] [--color[=when]] [--colour[=when]] [--context[=num]] [--label]
          [--line-buffered] [--null] [pattern] [file ...]

DESCRIPTION
     The grep utility searches any given input files, selecting lines that match one or more patterns.  By
     default, a pattern matches an input line if the regular expression (RE) in the pattern matches the input
     line without its trailing newline.  An empty expression matches every line.  Each input line that matches
     at least one of the patterns is written to the standard output.

     grep is used for simple patterns and basic regular expressions (BREs); egrep can handle extended regular
     expressions (EREs).  See re_format(7) for more information on regular expressions.  fgrep is quicker than
     both grep and egrep, but can only handle fixed patterns (i.e. it does not interpret regular expressions).
     Patterns may consist of one or more lines, allowing any of the pattern lines to match a portion of the
     input.

...
</pre>
</details>

Output on Linux:

<details>
<summary>Man output</summary>

<pre>
GREP(1)                                                                               User Commands                                                                              GREP(1)

NAME
       grep, egrep, fgrep, rgrep - print lines that match patterns

SYNOPSIS
       grep [OPTION...] PATTERNS [FILE...]
       grep [OPTION...] -e PATTERNS ... [FILE...]
       grep [OPTION...] -f PATTERN_FILE ... [FILE...]

DESCRIPTION
       grep searches for PATTERNS in each FILE.  PATTERNS is one or more patterns separated by newline characters, and grep prints each line that matches a pattern.  Typically PATTERNS
       should be quoted when grep is used in a shell command.

       A FILE of “-” stands for standard input.  If no FILE is given, recursive searches examine the working directory, and nonrecursive searches read standard input.

       In addition, the variant programs egrep, fgrep and rgrep are the same as grep -E, grep -F, and grep -r, respectively.  These  variants  are  deprecated,  but  are  provided  for
       backward compatibility.

...
</pre>
</details>

# CLI

## Usage

```
grep [options] [pattern] [file ...]
```


## Help

```sh
$ grep --help
```
Output on Linux:

<details>
<summary>Help output</summary>
    
```
grep --help
Usage: grep [OPTION]... PATTERNS [FILE]...
Search for PATTERNS in each FILE.
Example: grep -i 'hello world' menu.h main.c
PATTERNS can contain multiple patterns separated by newlines.

Pattern selection and interpretation:
  -E, --extended-regexp     PATTERNS are extended regular expressions
  -F, --fixed-strings       PATTERNS are strings
  -G, --basic-regexp        PATTERNS are basic regular expressions
  -P, --perl-regexp         PATTERNS are Perl regular expressions
  -e, --regexp=PATTERNS     use PATTERNS for matching
  -f, --file=FILE           take PATTERNS from FILE
  -i, --ignore-case         ignore case distinctions in patterns and data
      --no-ignore-case      do not ignore case distinctions (default)
  -w, --word-regexp         match only whole words
  -x, --line-regexp         match only whole lines
  -z, --null-data           a data line ends in 0 byte, not newline

Miscellaneous:
  -s, --no-messages         suppress error messages
  -v, --invert-match        select non-matching lines
  -V, --version             display version information and exit
      --help                display this help text and exit

Output control:
  -m, --max-count=NUM       stop after NUM selected lines
  -b, --byte-offset         print the byte offset with output lines
  -n, --line-number         print line number with output lines
      --line-buffered       flush output on every line
  -H, --with-filename       print file name with output lines
  -h, --no-filename         suppress the file name prefix on output
      --label=LABEL         use LABEL as the standard input file name prefix
  -o, --only-matching       show only nonempty parts of lines that match
  -q, --quiet, --silent     suppress all normal output
      --binary-files=TYPE   assume that binary files are TYPE;
                            TYPE is 'binary', 'text', or 'without-match'
  -a, --text                equivalent to --binary-files=text
  -I                        equivalent to --binary-files=without-match
  -d, --directories=ACTION  how to handle directories;
                            ACTION is 'read', 'recurse', or 'skip'
  -D, --devices=ACTION      how to handle devices, FIFOs and sockets;
                            ACTION is 'read' or 'skip'
  -r, --recursive           like --directories=recurse
  -R, --dereference-recursive  likewise, but follow all symlinks
      --include=GLOB        search only files that match GLOB (a file pattern)
      --exclude=GLOB        skip files that match GLOB
      --exclude-from=FILE   skip files that match any file pattern from FILE
      --exclude-dir=GLOB    skip directories that match GLOB
  -L, --files-without-match  print only names of FILEs with no selected lines
  -l, --files-with-matches  print only names of FILEs with selected lines
  -c, --count               print only a count of selected lines per FILE
  -T, --initial-tab         make tabs line up (if needed)
  -Z, --null                print 0 byte after FILE name

Context control:
  -B, --before-context=NUM  print NUM lines of leading context
  -A, --after-context=NUM   print NUM lines of trailing context
  -C, --context=NUM         print NUM lines of output context
  -NUM                      same as --context=NUM
      --color[=WHEN],
      --colour[=WHEN]       use markers to highlight the matching strings;
                            WHEN is 'always', 'never', or 'auto'
  -U, --binary              do not strip CR characters at EOL (MSDOS/Windows)

When FILE is '-', read standard input.  With no FILE, read '.' if
recursive, '-' otherwise.  With fewer than two FILEs, assume -h.
Exit status is 0 if any line (or file if -L) is selected, 1 otherwise;
if any error occurs and -q is not given, the exit status is 2.

Report bugs to: bug-grep@gnu.org
GNU grep home page: <http://www.gnu.org/software/grep/>
General help using GNU software: <https://www.gnu.org/gethelp/>
```

</details>


## Man page

```sh
$ man grep
```

Output on Linux:

```
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
```


## Flags

Highlights of some of the flags I used most or want to use.

### Common

| Short   | Long                 | Description                         |
| ------- | -------------------- | ----------------------------------- |
| -r, -R  | –-recursive           | Recursive                           |
| -v      | –-invert-match        | Invert match                        |
| -i      | –-ignore-case         | Case insensitive                    |
| -c      | --count             | print only a count of selected lines per FILE |
| -n      | --line-number         | print line number with output lines |


### Change output

| Short   | Long                 | Description                         |
| ------- | -------------------- | ----------------------------------- |
| -A      | --after-context=NUM  | Print num lines of training context |
| -o      | --only-matching      | show only nonempty parts of lines that match - this is useful if there are multiple matches on a line and you want to show each on a separate line |
| -H      | –-with-filename       | print file name with output lines   |
| -h      | –-no-filename         | suppress the file name prefix on output |
| -l      | –-files-with-matches  | print only names of FILEs with selected lines    |
| -L      | -–files-without-match |  print only names of FILEs with no selected lines   |

### Type of matches

| Short   | Long                 | Description                         |
| ------- | -------------------- | ----------------------------------- |
| -E      | -–extended-regexp     | Extended regex. Same as `egrep`.    |
| -F      | –-fixed-strings       | Same as `fgrep`.                    |
| -G      | –-basic-regexp        | Basic regex (default).              |
| -P      | -–perl-regexp         | Perl regular expression. Used to match non-greedy using `?` |

### Pattern

| -f PATH | -–file PATH           | take PATTERNS from FILE             |
| -e      | --regexp=PATTERNS    | use PATTERNS for matching           |


## Samples

### File

Search a file.

```sh
$ grep foo file.txt
```

Equivalent of:

```sh
$ cat file.text | grep foo
```

### Directory

Search recursively in current directory, case insenstively.

```sh
$ grep -ir PATTERN
```

### Filename

Show filename.

```sh
$ grep -H foobar *
foo.txt:This is foobar
bar.txt:This is another match for the foobar pattern
```

### URLs

Find URLs in a JSON which is only one line.

This uses a pattern I came up with - note it doesn't cover `?` or trailing `/`.

```sh
$ grep -Po "https:\/\/[\w./#-]*" file.txt
```

```
https://docs.mongodb.com/manual/core/data-model-design/
https://www.oreilly.com/library/view/50-tips-and/9781449306779/ch01.html
https://leetcode.com/
```

Use `-P` for non-greedy support. Pattern must be in Perl regex syntax.

Without `-P` flag:

```
https://
https://www.
https://
```

Without `-o` flag, you see the entire line, but with the match patterns highlighted (assuming colors are enabled).


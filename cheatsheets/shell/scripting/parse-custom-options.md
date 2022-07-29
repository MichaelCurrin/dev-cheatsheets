# Parse custom options

See [manpage](https://www.man7.org/linux/man-pages/man1/getopts.1p.html) for `getopts`.

## Resources

- [Parsing bash script options with getopts](https://sookocheff.com/post/bash/parsing-bash-script-arguments-with-shopts/)
- [Parse Command Line Arguments in Bash](https://www.baeldung.com/linux/bash-parse-command-line-arguments)


## Examples

From the getopts docs:

```sh
aflag=
bflag=

while getopts ab: name; do
  case $name in
  a) aflag=1 ;;
  b)
    bflag=1
    bval="$OPTARG"
    ;;
  ?)
    printf "Usage: %s: [-a] [-b value] args\n" $0
    exit 2
    ;;
  esac
done

if [ ! -z "$aflag" ]; then
  printf "Option -a specified\n"
fi
if [ ! -z "$bflag" ]; then
  printf 'Option -b "%s" specified\n' "$bval"
fi

shift $(($OPTIND - 1))
printf "Remaining arguments are: %s\n$*"
```

If you want to add a help flag:

```sh
while getopts 'ab:h' opt; do
  case "$opt" in
  a)
    # ...
    ;;
  b)
    # ...
    ;;
  ? | h)
    # ...
    ;;
  esac
done
```

# Parse custom options

See [manpage](https://www.man7.org/linux/man-pages/man1/getopts.1p.html) for `getopts`.

## Resources

- [Parsing bash script options with getopts](https://sookocheff.com/post/bash/parsing-bash-script-arguments-with-shopts/)
- [Parse Command Line Arguments in Bash](https://www.baeldung.com/linux/bash-parse-command-line-arguments)

## Example

```sh
#!/bin/bash

while getopts 'abc:h' opt; do
  case "$opt" in
  a)
    echo "Processing option 'a'"
    ;;

  b)
    echo "Processing option 'b'"
    ;;

  c)
    arg="$OPTARG"
    echo "Processing option 'c' with '${OPTARG}' argument"
    ;;

  ? | h)
    echo "Usage: $(basename $0) [-a] [-b] [-c arg]"
    exit 1
    ;;
  esac
done

shift "$(($OPTIND -1))"
```

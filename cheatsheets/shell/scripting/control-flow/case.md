# Case



## Syntax

```sh
case EXPRESSION in
PATTERN_1)
  STATEMENTS
  ;;

PATTERN_2)
  STATEMENTS
  ;;

PATTERN_N)
  STATEMENTS
  ;;

*)
  STATEMENTS
  ;;
esac
```

Using `*` is for a catch-all i.e. default.

Note no need for `break` like in C or JS.

Repeat for as many cases as you like. Recommended - put in `*` to handle no match.


## Examples

```sh
FOO=def

case "$FOO" in
  abc)
    echo 'Matched abc'
    ;;
  def)
    echo 'Matched def'
    ;;
  *)
    echo 'No match'
    ;;
esac
```

Result:

```
Matched def
```

Countries - from [article](https://linuxize.com/post/bash-case-statement/).

```sh
echo -n "Enter the name of a country: "
read COUNTRY

echo -n "The official language of $COUNTRY is "

case $COUNTRY in
England)
  echo -n "English"
  ;;

Brazil | Portugal)
  echo -n "Portuguese"
  ;;

*)
  echo -n "Unknown"
  ;;
esac
```

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


## Example

From [article](https://linuxize.com/post/bash-case-statement/).

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

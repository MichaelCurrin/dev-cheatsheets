# Case

Repeat for as many cases as you like. Recommended - put in `*` to handle no match.

```sh
case VALUE in
  CASE_1)
    # Action for case 1
    ;;
  CASE2 )
    # Action for case 2
    ;;
  *)
    # Action for no match.
    ;;
esac
```

e.g.

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

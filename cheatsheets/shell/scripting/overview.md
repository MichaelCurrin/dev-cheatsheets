# Overview

A quick reference of basic syntax.

Tip - if you use Bash and use a multi-line statement in the console, then when you press up to run it again it will be flattened to one line.


## If

```sh
if true; then
  echo 'Success'
fi

if true; then echo 'Success'; fi
```


## For

```sh
for X in A B C; do
  echo $X
done

# One line.
for X in A B C; do echo $x; done

for X in ${MY_ARRAY[@]; do
  echo $X
done
```

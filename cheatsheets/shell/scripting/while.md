# While


## Syntax

While:

```sh
while CONDITION; do
  ACTION
done
```


Do-while:

```sh
while 
  ACTION
do CONDITION; done
```


## Infinite loop

This generates a file every 5 minutes.

```sh
while true; do
  touch pic-`date +%s`.jpg
  sleep 300
done
```


## Counter

This script opens 4 terminal windows.

```sh
COUNTER="0"

while [ "$COUNTER" -lt 4 ]; do
  xterm &
  COUNTER=$[$COUNTER+1]
done
```

Or more easily with `for`.

```sh
for COUNTER in 0..4; do
  xterm &
done
```


## Ask for input until getting an integer

From [SO](https://stackoverflow.com/questions/24420342/is-there-a-do-while-loop-in-bash).

```sh
while
  echo "Enter number: "
  read N
  [[ -z "$N" || "$N" == *[^0-9]* ]]
do true; done
```

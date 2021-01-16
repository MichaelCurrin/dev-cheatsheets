# Random

## Basic

Use the `RANDOM` variable to generate a random number.

```sh
$ echo $RANDOM
31267
```

## Range

Use the modulus operator to get a number between 0 and N - 1.

```sh
$ $RANDOM % 3
```
That will generate a value as `0`, `1`, or `2`.


## Control flow

Use a condition agains the value. Here if the value is `0` (with a 1 in 3 chance), then the script will exit with a success. Note use of double brackets for maths evaluations to handle `%`.

```sh
(( $RANDOM % 3 != 0 )) && (echo 'Skipping' ; exit 0)

# Do stuff
```

```sh
if (( $RANDOM % 3 != 0 )) ; then
  echo 'Condition matched'
else
  echo 'Not matched'
fi
```

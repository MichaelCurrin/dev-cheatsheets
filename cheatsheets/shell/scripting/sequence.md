# Sequence

## Ascending numbers

```sh
echo {0..10}
```


## Descending numbers

```sh
echo {10..0}
```

## Every second number

```sh
echo {0..10..2}
```

## Letters

```sh
echo {a..z}
```


## Combine

```sh
echo {0..2}{0..2}
```
```
00 01 02 10 11 12 20 21 22
```


Store as a variable.

```sh
$ LETTER_COMBOS=({a..z}{a..z})

$ echo $LETTER_COMBOS
aa ab ac ad ae af ag ah ai aj ak al am an ao ap aq ...
```

# cd


## Navigate to directory

```sh
$ cd foo
```

```sh
$ cd ..
```

Note in ZSH you can omit `cd`.

e.g.

```sh
$ foo
```

```sh
$ ..
```


## Navigate to user directory

```sh
$ cd
```

Same as:

```sh
$ cd ~
```


## Navigate to previous directory

```sh
$ cd -
```

e.g.

```sh
$ cd foo
$ cd fizz/buzz
$ cd -
$ pwd
foo
````

Use a number to go back further.

```sh
$ cd -NUMBER
```

e.g.

```sh
$ cd abc
$ cd def
$ cd ghi
$ cd -2
$ pwd
abc
```

See also `pushd` and `popd` commands - useful in scripting when navigating into a directory and up again without `cd..`.


# Create directory

The use of `make` comes from a C background, where you compile files and create a directory or a compiled file.

For example, consider this setup.

- `Makefile`
    ```make
    out:
      mkdir -p out
      cp public/* out
    ```

If the `out` directory does _not_ exist, then all the commands will be run.

```sh
$ make out
```
```
mkdir -p out
cp public/* out
```

If it _does_ exist, then all the steps will be skipped.

```sh
$ make out
```
```
make: `out' is up to date.
```

If you want the command to _always_ run and ignore the existence of directory or the updated file a compiled file, add it your the phony setup.

- `Makefile
  ```make
  .PHONY: out
  ```

Now if you run this repeately, all the steps will be run.

```sh
$ make out
```

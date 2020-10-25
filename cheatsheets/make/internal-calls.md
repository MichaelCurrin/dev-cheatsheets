# Internal calls


## Run before first step

Run `make foo` first, whenever `make bar` is run.

```Makefile
foo:
	@echo 'Foo'

bar: foo
	@echo 'Bar'
```

```sh
$ make bar
Foo
Bar
```


## Run after first step

Run `bar` within `foo`:

```Makefile
foo:
	@echo 'Foo'

bar:
	@echo 'Bar'
	$(MAKE) foo
```

```sh
$ make bar
Bar
Foo
```

You can do either:

```make
bar:
	make foo
```

Or this, which is more common and preferred.

```make
bar:
	$(MAKE) foo
```

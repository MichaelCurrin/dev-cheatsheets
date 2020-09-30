---
title: Call another target
---


## Run before first step

Run `foo` first, whenever `make bar` is run.

```makefile
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
	echo 'Foo'

bar:
	@echo 'Bar'
	@$(MAKE) foo
```

```sh
$ make bar
Bar
Foo
```

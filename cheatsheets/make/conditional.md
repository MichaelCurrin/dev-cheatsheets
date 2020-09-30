---
title: Conditional
---


## if

Using `@if`. This can be used as a check used in other commands.

```mk
foo:
	@echo "Exporting environment";
	@export ENVIRONTMENT=prod;
	@if [ -z $(FOO) ]; then \
		echo "FOOOOO must be set; export FOO=<foo>"; exit 10;
	fi
```

## ifneq

Using `ifneq`. Note lack of indentation.

```makefile
foo:
ifneq ($(wildcard ./fizz/$(BUZZ)),)
	$(eval NAME=$(shell sh -c "grep ..."))
endif
	...
```

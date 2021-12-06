# Dynamic targets


## Percentage evaluation

1. Set up a target like `PRE.%` where the `%` can be matched dynamically.
2. Then call it using `PRE.VALUE` e.g. `echo.deps`.
3. Use the value in the `PRE.%` target as `$*`.


Example:

```make
cyan = "\\033[1\;96m"
off  = "\\033[0m"

echo.%:
	@echo "\n$(cyan)Building $*$(off)"

deps: echo.deps
	pip install --upgrade pip
	pip install -r requirements.txt

site: echo.site
	rm -rf site
    mkdir site
    mkdocs build
```


## Variable name target

From [edx/auth-backend](https://github.com/edx/auth-backends/blob/master/Makefile).

```make
MY_VAR=abc.txt
.PHONY: $(MY_VAR)
$(MY_VAR):
	# ...
```

e.g.

```make
COMMON_CONSTRAINTS_TXT=requirements/common_constraints.txt
.PHONY: $(COMMON_CONSTRAINTS_TXT)
$(COMMON_CONSTRAINTS_TXT):
	wget -O "$(@)" https://raw.githubusercontent.com/edx/edx-lint/master/edx_lint/files/common_constraints.txt || touch "$(@)"
```

In this case it was followed by two `upgrade` targets.

```make
upgrade: export CUSTOM_COMPILE_COMMAND=make upgrade
upgrade: $(COMMON_CONSTRAINTS_TXT)  ## update the requirements/*.txt files with the latest packages satisfying requirements/*.in
```

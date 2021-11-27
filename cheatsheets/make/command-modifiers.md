# Command modifiers

## Silent

Add `@` to prevent the line from being shown in the CLI. This is useful for `echo` commands, to avoid duplicating output.

```Makefile
greet:
	@echo 'Printing output'

	echo 'This line will appear twice'
```

```console
$ make greet
Printing output
echo 'This line will appear twice'
This line will appear twice
```
  
  
## No run
  
Add `:` to show the line and do not execute it.

```Makefile
name ?= foo

greet:
	: $(name)
```

```console
$ make greet
: foo
```

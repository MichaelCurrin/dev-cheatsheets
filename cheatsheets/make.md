# Make

Use of `make` command in Unix environments.

Makefile templates topic on Github - [makefile-template](https://github.com/topics/makefile-template)

Targets (commands) will differ per project and environment but these can be applied where relevant.




## Export

Use variables in commands.

Given file `.env` with variable set as `FOO=bar` and `script_that_echoes_foo.sh` which does `echo $FOO`.

### Do

The combination of `export` and `source` works well.

```make
export FOO=''

test:
  source .env && echo $$FOO
  source .env && ./script_that_echoes_foo.sh
```


### Don't do

The following will not work as expected ,due to `make` limitations on environment setting of child processes.

```make
test:
  source .env
  echo $$FOO
```

The following will not work either, with or without `export` set at the top.

```make
test:
  export $(<.env) && ./script_that_echoes_foo.sh
```

## Help

```make
help:
	@echo Print lines that are not indented (targets and comments) or empty.
	@egrep '^\S|^$$' Makefile
```

If you use `@echo` within your targets:

```make
help:
	@echo Print lines that are not indented (targets and comments) or empty, plus any indented echo lines.
	@egrep '(^\S)|(^$$)|\s+@echo' Makefile
```

## Jekyll

```make
install:
	bundle install --path vendor/bundle

upgrade:
	bundle update
	
s serve:
	bundle exec jekyll serve
```

## Python

See [Makefile in MichaelCurrin/py-project-template](https://github.com/MichaelCurrin/py-project-template/blob/master/Makefile) on Github.

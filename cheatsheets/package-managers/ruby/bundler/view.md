# View


## info

```sh
$ bundle info GEM [OPTIONS]
```

### Show gem info

```sh
$ bundle info minima
```
```
  * minima (2.5.1)
	Summary: A beautiful, minimal theme for Jekyll.
	Homepage: https://github.com/jekyll/minima
	Path: /Users/mcurrin/repos/_static-sites/jekyll-blog-demo/vendor/bundle/ruby/2.7.0/gems/minima-2.5.1
```

### Show gem path

```sh
$ bundle info minima --path
```
```
/Users/mcurrin/repos/_static-sites/jekyll-blog-demo/vendor/bundle/ruby/2.7.0/gems/minima-2.5.1
```

This replaces the now deprecated `bundle show GEM`.


## open

Open the source directory of the given gem.

```sh
$ bundle open GEM
```

That will use your default folder browser.

But, this depends on your system default open program.

Using `nano`, I get an error that the path is directory and that is can't open it.

```sh
$ bundle open minima
```

For more control, get the path first and pass that to a program like VS Code, Sublime or Finder.

To open in VS Code:

```sh
$ code $(bundle info minima --path)
```

# Current directory

Each line is run separately and the state is reset. State like the current directory is **not** shared across lines in a target. 

```Makefile
a:
	cd docs
	pwd

b: 
	cd docs && pwd
	pwd

c:
	(cd docs && pwd)
	pwd
```

So `make a` will print the root path not `.../docs`.

And both `make b` and `make c` will print `.../docs` and then the root. 

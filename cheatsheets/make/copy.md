# Copy

This will make sure the order-only prerequisite exists (`abc.example.txt`) and then copy it to the target (`abc.txt`).
```make
abc.txt: | abc.example.txt
	cp $| $@
```

Usage:

```sh
$ make abc.txt
```

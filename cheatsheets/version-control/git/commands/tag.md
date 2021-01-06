# tag


## Create

Tag the current commit.

```sh
$ git tag v0.1.0
```

Tag with commit reference.

```sh
$ git tag v0.1.0 abcdef0
```

Add a message.

```sh
$ git tag v0.1.0 -m "Add foo to bar"
```


## Delete

You'll get an error if a tag exists.

```sh
$ git tag v0.1.0
fatal: tag 'v0.1.0' already exists
```

Delete.

```sh
$ git tag -d v0.1.0
```

Then create again.


## List

With no args, list all tags.

```sh
$ git tag
```

The `-l` or `--list` flags alone add nothing here.

But that can be useful when finding a tag.

```sh
$ git tag -l -n v0.1.0
v0.1.0
```


## Tag message

Add a message.

```sh
$ git tag v0.1.0 -m "Add foo to bar"
```

View it. This will show a given number of lines - using `-n9` would show more lines of a tag.

```sh
$ git tag -n
v0.0.0     v0.0.0
v0.1.0     Add foo to bar
```


## Annotate

Sign the tag with annotation.

```sh
$ git tag v0.1.0 -a
```

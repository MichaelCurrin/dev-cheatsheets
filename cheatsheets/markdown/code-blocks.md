---
title: Code blocks
---
<!-- TODO I've written about this somewhere before - combine -->

- Github's source of highlighting:[languages.yml](https://github.com/github/linguist/blob/master/lib/linguist/languages.yml) in the Linguist repo.


## Language highlighting

	```python
	print("Hello, world!")
	```

```python
print("Hello, world!")
```

The short name works - I don't know if it has the same coverage though.

	```py
	print("Hello, world!")
	```

```py
print("Hello, world!")
```

## Specific languages

- `shell` or `sh` or `bash`

### Diff

	```diff
	- a
	+ b
	```

```diff
- a
+ b
```

### JSON

	```json
	{
	    "foo": "bar"
	}
	```

```json
{
    "foo": "bar"
}
```

With comments, use `json5` to avoid getting errors for invalid content on Github. Note some platforms like StackEdit don't recognized `json5` but is okay.

	```json5
	{
	    // This is a comment.
	    "foo": "bar"
	}
	```


```json5
{
    // This is a comment.
    "foo": "bar"
}
```

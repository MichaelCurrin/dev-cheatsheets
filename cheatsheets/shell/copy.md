---
title: Copy
---

See also `cp` under Commands section.


## Directory

```sh
cp -R SOURCE DEST
```

## Interactive

```sh
cp -i SOURCE DEST
```

## Force

```sh
cp -f SOURCE DEST
```

Note that will not work if you have interactive aliased. So you'll to reference the non-aliased form. Or do this.

```sh
yes | cp SOURCE DEST
```

[answer on SO](https://stackoverflow.com/questions/8488253/how-to-force-cp-to-overwrite-without-confirmation)


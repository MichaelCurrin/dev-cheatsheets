# clone


## Default

```sh
$ git clone URL
$ git clone URL DIR_NAME
```

e.g.

```sh
$ git clone git@github.com:MichaelCurrin/dev-cheatsheets.git

$ git clone git@github.com:MichaelCurrin/dev-cheatsheets.git custom-name
$ cd custom-name
```


## Shallow

Clone just one commit, to make downloading quicker.

```sh
$ git clone URL --depth 1
```

When you check the log, you'll see something like this.

```sh
$ git log
* b385b6c (grafted, HEAD -> master, origin/master, origin/HEAD) Added foo to bar
```

# Commit a change 


## New files

For a new file or directory.

```sh
$ git add PATH
$ git commit PATH
```

## Changes in a directory

I rarely use `add` if a file already exists.

If I make file changes, then I do this for the directory (or use a dir name).

```sh
git commit .
```

You'll need an _all_ flag if you want to include _untracked_ files.

You can also check the comments in your commit message editor window if you need to see which paths are going to be committed. Or use `git status` before you commit.


## Changes to existing files

Here I commit changes to `package.json` and `package-lock.json` without using `add` but preventing changes in other files getting commited.

```sh
$ git commit package*
```

That is the same as these two steps:

```sh
$ git add package*
$ git commit
```

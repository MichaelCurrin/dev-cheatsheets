# Remote

## Change remote

```sh
$ git remote set-url origin git@github.com:MichaelCurrin/cheatsheets.git
```

## Add remote to a new repo

When you setup a repo like this, you won't have any remotes.

```sh
$ git init
```

This should give nothing.

```sh
$ git remote -v
```

Add a remote.

```sh
$ git remote add origin git@github.com:MichaelCurrin/dev-cheatsheets.git
```

You can commit and push now. 

You need to include the remote name and branch the first time you pull. Note you'll get an error doing a pull on an empty remote.

```sh
$ git pull origin master
```

Then just:

```sh
$ git pull
```

Note that if you use VS Code to push, it will create the repo for you on GitHub without having to go through the GitHub UI.

### Add remote for a fork

Give you have forked a repo and cloned it and it has this remote setup:

- `origin git@github.com:MichaelCurrin/dev-cheatsheets.git`.

If you want to pull in changes from the original repo into your fork, you can do this. The name `upstream` is a common name to use.

```sh
$ git remote add upstream git@github.com:SomeUsername/dev-cheatsheets.git`.
```

```sh
$ git checkout master
```

```sh
$ git pull upstream master
$ # Or
$ git reset --hard upstream master
```

Push your local commits to your fork.

```sh
$ git push
```

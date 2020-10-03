# Configure git


## Edit directly

Open `~/.gitconfig` in you IDE.


## Edit in terminal

View or edit the config using `-e` for edit.

```sh
$ git config -e
```

Or global config.

```sh
$ git config -e --global
```


## Set specific details

```sh
$ git config -e --global SECTION.SUBSECTION VALUE
```

Example:

```sh
$ git config -e --global user.name 'Name Surname'
$ git config -e --global user.email nsurname@example.com
```


## Configure merge strategy for pull

If your pull strategy is not configured, `git` will now give this warning running `git pull`:

<details>
<summary>Warning message</summary>

```
warning: Pulling without specifying how to reconcile divergent branches is
discouraged. You can squelch this message by running one of the following
commands sometime before your next pull:

    git config pull.rebase false  # merge (the default strategy)
    git config pull.rebase true   # rebase
    git config pull.ff only       # fast-forward only

You can replace "git config" with "git config --global" to set a default
preference for all repositories. You can also pass --rebase, --no-rebase,
or --ff-only on the command line to override the configured default per
invocation.
```

</details>

So here are your options for `.gitconfig` under `[pull]` heading.

### Merge approach

```toml
[pull]
    rebase = false
```
This was what we are used to.


Running `git pull` will create a merge commit if there are upstream changes. This is probably not desirable.

### Rebase approach

```toml
[pull]
    rebase = true
```

This means that `git pull` effectively does this:

```sh
$ git pull --rebase
```

This is probably what you want and generally safe to do often. You rebase local unpushed changed, pulling in the remote changes.

The **problem** is that when setting the config as above, the pull will fail if there are any uncommitted changes. This can be annoying when you know you have nothing to rebase and just want to do a plain `git pull`.

### Fast-forward approach

```toml
[pull]
    ff = "only"
```

This approach will attempt to do a `git pull` to get the branch up to date with the remote and fast-forward if possible. Equivalent to:

```sh
$ git pull --ff-only
# ...
fatal: Not possible to fast-forward, aborting.
```

If there are remote changes, if will **fail**.

Then you can run this do deliberately choose a rebase.

```sh
$ git pull --rebase
```

If you **do** want a merge commit, then you can just run this immediately after:

```sh
$ git merge
```

You've already done the `git fetch` with the pull. So now this will merge `origin/master` into `master`, or the equivalent pair for the branch you're on.

Generated message:

```
Merge remote-tracking branch 'refs/remotes/origin/master' into master
```

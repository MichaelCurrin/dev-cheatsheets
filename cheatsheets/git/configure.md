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

### About

In some situations, you do want a merge commit such as pulling a feature branch into master (if you want to do this on the CLI for some reason rather than PR  Merge button). And sometimes you don't want a commit and you just want to rebase the current branch on the remote or on the remote master. The sections below help with these.

### Defaults

The `git pull` default behavior is with `--ff`.

You can set `--no-ff` or `--ff-only` using flags to config options.

The 

### Warning

If your pull strategy is not configured, newer versions of `git` will now give this warning running `git pull`:

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

Note lack of quotes on `true` and `false`.


### Merge approach

```toml
[pull]
    rebase = false
```

This is the default behavior that we are used to, but now configure explicitly as a strategy in the config.

Running `git pull` will create a **merge commit** if there are remote upstream changes. This commit probably not desirable when working on a feature branch.

So you could set this option explicitly in your config to get the warning to disappear - and then use `git pull --rebase` manually when you do want to rebase.

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

Then you can run this to deliberately choose a rebase.

```sh
$ git pull --rebase
```

If you **do** want a merge commit, could run this after.

```sh
$ git merge
```

As you've already done the `git fetch` with the pull. So now this will merge `origin/master` into `master`, or the equivalent pair for the branch you're on.

Generated message:

```
Merge remote-tracking branch 'refs/remotes/origin/master' into master
```

However, you may want to be more explict with your merge. Such as if you do `git pull origin my-feature` then `git merge` probably needs to be `git merge origin/my-feature`.

Alternatively, you can do this to pull and merge in one move, avoiding the error. Maybe as an alias.

```sh
$ git pull origin my-feature && git merge origin/my-feature
```


# pull


## Help


```sh
$ git pull --help
```

### Intro

```
NAME
       git-pull - Fetch from and integrate with another repository or a local branch

SYNOPSIS
       git pull [<options>] [<repository> [<refspec>...]]


DESCRIPTION
       Incorporates changes from a remote repository into the current branch. In its default mode, git pull is shorthand for git
       fetch followed by git merge FETCH_HEAD.

       More precisely, git pull runs git fetch with the given parameters and calls git merge to merge the retrieved branch heads
       into the current branch. With --rebase, it runs git rebase instead of git merge.

...
```

### Verbosity

```
       -q, --quiet
           This is passed to both underlying git-fetch to squelch reporting of during transfer, and underlying git-merge to
           squelch output during merging.

       -v, --verbose
           Pass --verbose to git-fetch and git-merge.
```

### Submodules

```
       --[no-]recurse-submodules[=yes|on-demand|no]
           This option controls if new commits of populated submodules should be fetched, and if the working trees of active
           submodules should be updated, too (see git-fetch(1), git-config(1) and gitmodules(5)).

           If the checkout is done via rebase, local submodule commits are rebased as well.

           If the update is done via merge, the submodule conflicts are resolved and checked out.
```

### Options relating to merging

```
       --commit, --no-commit
           Perform the merge and commit the result. This option can be used to override --no-commit.

           With --no-commit perform the merge and stop just before creating a merge commit, to give the user a chance to inspect
           and further tweak the merge result before committing.

           Note that fast-forward updates do not create a merge commit and therefore there is no way to stop those merges with
           --no-commit.
```

```
        --ff, --no-ff, --ff-only
           Specifies how a merge is handled when the merged-in history is already a descendant of the current history.  --ff is
           the default unless merging an annotated (and possibly signed) tag that is not stored in its natural place in the
           refs/tags/ hierarchy, in which case --no-ff is assumed.

           With --ff, when possible resolve the merge as a fast-forward (only update the branch pointer to match the merged
           branch; do not create a merge commit). When not possible (when the merged-in history is not a descendant of the
           current history), create a merge commit.

           With --no-ff, create a merge commit in all cases, even when the merge could instead be resolved as a fast-forward.

           With --ff-only, resolve the merge as a fast-forward when possible. When not possible, refuse to merge and exit with a
           non-zero status.
```

Skip editing message of merge commit.

e.g.

```sh
$ git pull origin my-feat --no-edit
```
```
       --edit, -e, --no-edit
           Invoke an editor before committing successful mechanical merge to further edit the auto-generated merge message, so
           that the user can explain and justify the merge. The --no-edit option can be used to accept the auto-generated message
           (this is generally discouraged).

           Older scripts may depend on the historical behaviour of not allowing the user to edit the merge log message. They will
           see an editor opened when they run git merge. To make it easier to adjust such scripts to the updated behaviour, the
           environment variable GIT_MERGE_AUTOEDIT can be set to no at the beginning of them.
```

Note to self - don't worry about creating an alias for that as it is rare that I do a pull merge commit on the command-line and it easy to step through.

### Rebase

Example:


```sh
$ git pull --rebase
$ git pull --no-rebase
```

Help:
```
       -r, --rebase[=false|true|merges|preserve|interactive]
           When true, rebase the current branch on top of the upstream branch after fetching. If there is a remote-tracking
           branch corresponding to the upstream branch and the upstream branch was rebased since last fetched, the rebase uses
           that information to avoid rebasing non-local changes.

           When set to merges, rebase using git rebase --rebase-merges so that the local merge commits are included in the rebase
           (see git-rebase(1) for details).

           When set to preserve (deprecated in favor of merges), rebase with the --preserve-merges option passed to git rebase so
           that locally created merge commits will not be flattened.

           When false, merge the current branch into the upstream branch.

           When interactive, enable the interactive mode of rebase.

           See pull.rebase, branch.<name>.rebase and branch.autoSetupRebase in git-config(1) if you want to make git pull always
           use --rebase instead of merging.

               Note
               This is a potentially dangerous mode of operation. It rewrites history, which does not bode well when you
               published that history already. Do not use this option unless you have read git-rebase(1) carefully.
```
```
       --no-rebase
           Override earlier --rebase.

```


### Short help

Using `-h` rather than `--help`.

```sh
$ git pull -h
```
```
usage: git pull [<options>] [<repository> [<refspec>...]]

    -v, --verbose         be more verbose
    -q, --quiet           be more quiet
    --progress            force progress reporting
    --recurse-submodules[=<on-demand>]
                          control for recursive fetching of submodules
```
```
Options related to merging
    -r, --rebase[=(false|true|merges|preserve|interactive)]
                          incorporate changes by rebasing rather than merging
    -n                    do not show a diffstat at the end of the merge
    --stat                show a diffstat at the end of the merge
    --log[=<n>]           add (at most <n>) entries from shortlog to merge commit message
    --signoff[=...]       add Signed-off-by:
    --squash              create a single commit instead of doing a merge
    --commit              perform a commit if the merge succeeds (default)
    --edit                edit message before committing
    --cleanup <mode>      how to strip spaces and #comments from message
    --ff                  allow fast-forward
    --ff-only             abort if fast-forward is not possible
    --verify-signatures   verify that the named commit has a valid GPG signature
    --autostash           automatically stash/stash pop before and after
    -s, --strategy <strategy>
                          merge strategy to use
    -X, --strategy-option <option=value>
                          option for selected merge strategy
    -S, --gpg-sign[=<key-id>]
                          GPG sign commit
    --allow-unrelated-histories
                          allow merging unrelated histories
```
```
Options related to fetching
    --all                 fetch from all remotes
    -a, --append          append to .git/FETCH_HEAD instead of overwriting
    --upload-pack <path>  path to upload pack on remote end
    -f, --force           force overwrite of local branch
    -t, --tags            fetch all tags and associated objects
    -p, --prune           prune remote-tracking branches no longer on remote
    -j, --jobs[=<n>]      number of submodules pulled in parallel
    --dry-run             dry run
    -k, --keep            keep downloaded pack
    --depth <depth>       deepen history of shallow clone
    --shallow-since <time>
                          deepen history of shallow repository based on time
    --shallow-exclude <revision>
                          deepen history of shallow clone, excluding rev
    --deepen <n>          deepen history of shallow clone
    --unshallow           convert to a complete repository
    --update-shallow      accept refs that update .git/shallow
    --refmap <refmap>     specify fetch refmap
    -o, --server-option <server-specific>
                          option to transmit
    -4, --ipv4            use IPv4 addresses only
    -6, --ipv6            use IPv6 addresses only
    --negotiation-tip <revision>
                          report that we have only objects reachable from this object
    --show-forced-updates
                          check for forced-updates on all updated branches
    --set-upstream        set upstream for git pull/fetch
```

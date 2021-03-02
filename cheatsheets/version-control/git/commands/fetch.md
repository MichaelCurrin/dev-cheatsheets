# fetch

## Resources

- [git fetch](https://git-scm.com/docs/git-fetch) in Git docs.


## Default behavior

Run without flags. This will fetch _all_ branches - see [Verbose](#verbose) section output for more details.

```sh
$ git fetch
```

This runs for the default remote only.

This will **not** fetch tags or other remotes.


## Fetch one branch only

If for some reason you only want to fetch a single branch, you can do this.

```sh
g fetch origin abc
From github.com:MichaelCurrin/my-repo
 * branch            abc             -> FETCH_HEAD
```


## Fetch all remotes

You probably don't need this.

If you have multiple remotes, then use this.

```sh
$ git fetch --all
```

For example, if you created a fork and want to keep your fork in sync with the original repo (or "upstream" as it is conventionally named).

Here are two remotes and both will be fetched.

- `origin` - the remote in use for your own branches. Including if your repo is a fork.
- `upstream` - the remote used for the original repo's branches.


## Fetch tags

```sh
$ git fetch --tags
```




## Verbose

Here we see the names of branches on `origin` which were fetched.

```sh
$ git fetch -v
```
```
remote: Enumerating objects: 21, done.
...
From github.com:MichaelCurrin/my-repo
 = [up to date]      abc       -> origin/abc
 = [up to date]      master    -> origin/master
   e63d881..9b27383  def       -> origin/def
```


## Dealing with branches that are out of sync

The flows below are based on the verbose output above.

The `abc` and `master` branches are up to date. However, even if `abc` branch does not exist locally as a checked out branch, it still shows the same in the output above, in all 3 columns.

The `def` branch above is out of sync. 

For example:

- Maybe you just need to push local changes.
- If remote changes need to be pulled in:
    ```sh
    $ git checkout def

    $ git merge origin/def

    $ # Or do a fetch and merge in one step:
    $ git pull
    $ # Longer form:
    $ git pull origin def
    ```
- If there was a force push, you need to delete and recreate the branch. This has the same effect:
    ```sh
    $ git checkout def
    $ git reset --hard origin/def
    ```


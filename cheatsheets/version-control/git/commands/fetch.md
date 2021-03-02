# fetch


## Default

This will fetch _all_ branches for the default remote (such as origin).

```sh
$ git fetch
```


## Verbose

Here we see the names of branches on `origin` which were fetched.
```sh
$ git fetch -v
```
```
remote: Enumerating objects: 21, done.
...
From github.com:MichaelCurrin/repo-name
 = [up to date]      abc       -> origin/abc
 = [up to date]      master    -> origin/master
   e63d881..9b27383  def       -> origin/def
```

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

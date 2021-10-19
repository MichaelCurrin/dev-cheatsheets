# Ignore

Specify paths that should not get added to the image.

add a `.dockerignore` file to the context directory. That will exclude files and directories.


## Reference

- [.dockerignore file](https://docs.docker.com/engine/reference/builder/#dockerignore-file) in Builder docs.


## Benefits

- Keeps the image size down and free of clutter like docs, the Git repo, cache files, pacakages, and dev files like tests.
- Improves security - stop local configs with credentials from getting added to the image.
- Improves build time. Whenever you make a change to a file in the repo recognized by `COPY . .`, then the entire layer for that has to be rebuilt. So if you have any irrevelant (docs) or frequently changing files (build cache), then ignore those.


## Syntax

Add paths `.dockerignore` in the root of the build context (such as you repo root).

Paths can be like in `.gitignore`. Note that a directory name is sufficient - you don't need `**` after a directory name. Use leading forward slash if for someone tha level of precision matters.


## Examples

### Base

- `.dockerignore`
    ```
    .git/

    docs/
    *.md
    ```
    
### Packages

For a Python project, ignore your virtual environment:

```
# ...

venv
```

For a JS project, ignore the NPM packages. Rather install these from inside the image so the state of the packages outside the image won't affect it.

```
# ...

node_modules/
```

### Configs

If you have any secrets:

```
# ...

.env
app.local.conf
```

### Volume

For a volume of variables files, you might want to prevent the one on the host from added on the host so that there is no confusion. The container will use a volume so that the directory points to the host's one.

```
# ...

myapp/var/
```

Then run:

```sh
$ docker run --rm \
  -v "$PWD/myapp/var:/usr/src/app/myapp/var/" \
  my-app
```

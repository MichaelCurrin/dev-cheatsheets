---
title; Create
description: Set up a submodule
---

## Steps

### 1. Add a submodule

Reference a git repo such as by GitHub or BitBucket URL. The repo name will be used by default, but you can set your own name for the path and a directory path if you need to.

```sh
$ git submodule add SUB_MODULE_URL
$ # Or
$ git submodule add SUB_MODULE_URL PATH
```

e.g. Add the `awesomelibrary` repo as a submodule in the outer repo root as `awesomelibrary`.

```sh
$ git submodule add https://bitbucket.org/jaredw/awesomelibrary
```

e.g. For a Hugo site, add the `gohugo-theme-ananke` repo to the `themes` directory as `ananke`.

```sh
$ git submodule add https://github.com/budparr/gohugo-theme-ananke.git themes/ananke
```

Check the result:

```sh
$ git status
...
 new file:   .gitmodules
 new file:   awesomelibrary
```

- `.gitmodules` file contents:
    ```ini
    [submodule "awesomelibrary"]
     path = awesomelibrary
     url = https://bitbucket.org/jaredw/awesomelibrary
    ```

Check the contents.

```sh
$ ls awesomelibrary
```

### 2. Commit

Commit the submodule changes.

```sh
$ git add .gitmodules awesomelibrary/
$ git commit -m "Add submodule"
```

### 3. Push

Then push to GitHub.

Note your submodule will appear with a hash reference next to it. And if you click from GitHub, you'll go to that other repo.

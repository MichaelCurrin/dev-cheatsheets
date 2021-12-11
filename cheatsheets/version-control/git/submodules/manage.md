# Manage



## Update submodule

### 1. Pull in changes

Pull in changes. Note that without `--remote`, nothing will happen.

```sh
$ git submodule update --rebase --remote
```

I found that recommended in [Hugo docs](https://gohugo.io/hosting-and-deployment/hosting-on-netlify/) for themes.

That is effectively the same as this, but I wouldn't recommend this. Also note that `git pull` alone will warn that you are not on a branch.

```sh
$ cd themes/ananke
$ git pull origin master
$ cd ..
```

If you want to use tag instead. See [Tags][] cheatsheet.

```sh
cd themes/ananke
git checkout $(git describe --abbrev=0 --tags)
cd ..
```

[Tags]: {% link cheatsheets/version-control/git/tags.md %}

Check for changes. You should see that the submodule object appears to change from one commit to another, without showing the full details (because you repo doesn't care about the all commits and the files, just the commit reference).

```console
$ git diff
...
--- a/themes/ananke
+++ b/themes/ananke
@@ -1 +1 @@
-Subproject commit 0cc2c6cb62bbe86dbafc3e4e3b083d2654934aa3
+Subproject commit 988c731a5762a6e0a1aad4fd2023caa2dc1e082d
...
```

### 2. Commit

Then commit the new reference.

```sh
$ git commit SUB_MODULE_PATH
$ # e.g.
$ git commit themes/ananke
```


## Reset

After updating a submodule but not committing, I wanted to go back the old submodule reference. Using `git checkout` doesn't help here, even though the reference shows up as modified.

This works though:

```sh
$ git submodule update
```

Then `git status` was clean.

You may need one of these flags:

```sh
$ git submodule update --checkout
```

```sh
$ git submodule update --force
```


## Get submodule content

Assuming you have repo on GitHub that has at least one submodule, you want to clone it somewhere (maybe in another local location to test it) or on another machine or in CI.

When you clone the outer repo, the internal repo references will be included, since submodule reference exist are commit objects. But, the submodule directories will be **empty** initially.

To download the content, you need to either one of these steps.

### Clone with submodules

```sh
$ git clone OUTER_REPO_URL --recurse-submodules
```

That is equivalent to the section below.

### Initialize and update submodule manually

```sh
$ git clone OUTER_REPO_URL
$ cd my-repo
$ git submodule init
$ git submodule update
```

## Switch branches

When you have branches pointing to different commits of a submodule, the submodule will appear as modified.

The docs recommend this as a solution, presumably with a branch name passed too.

```sh
$ git checkout --recurse-submodules
```

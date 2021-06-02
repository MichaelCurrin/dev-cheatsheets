# Submodules

See the [About](#about) section below to learn what Submodules are and how to use them.


## GitHub view

If you view a submodule on GitHub, you get a reference to the directory name and the commit.

e.g. In the [themes](https://github.com/MichaelCurrin/hugo-quickstart/tree/master/themes) directory on my Hugo Quickstart, the submodule `ananke` is displayed in the GitHub UI as

- `ananke @ 0cc2c6c` 


## Set up a submodule

### 1. Add a submodule

Reference a git repo such as by GitHub or BitBucket URL.

```sh
$ git submodule add SUB_MODULE_URL
```

e.g.

```sh
$ git submodule add https://bitbucket.org/jaredw/awesomelibrary
```

e.g. For a Hugo site, where you add a submodule to the `themes` directory.

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

Then push to GitHub.


## Update submodule

### 1. Pull in changes

```sh
$ git submodule update
```

I found that didn't actually do anything, but this works great:

```sh
$ git submodule update --rebase --remote
```

Check changes.

```sh
$ git diff
```
```
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


## Get submodule content

Assuming you have repo on GitHub that has at least one submodule, you want to clone it somewhere (maybe in another local location to test it) or on another machine or in CI.

When you clone the outer repo, the internal repo references will be included, since submodule reference exist are commit objects. But, the submodule directories will be **empty** initially.

To download the content, you need to either one of these steps.

### Clone recursively

```sh
$ git clone OUTER_REPO_URL --recursive
```

That is equivalent to below.

### Initialize and update submodule manually

```sh
$ git clone OUTER_REPO_URL
$ cd my-repo
$ git submodule init
$ git submodule update
```


## Restore

After updating a submodule but not committing, I wanted to go back the old submodule reference. Using `git checkout` doesn't help here, even though the reference shows up as modified.

This worked though:

```sh
$ git submodule update
```

Then `git status` was clean.


## About

### Resources

[Submodules](https://www.atlassian.com/git/tutorials/git-submodule) tutorial in Atlassian docs.

### What are submodules?

A git submodule allows you to put a git repo as a directory inside another git repo, but without inflating the outer repo or duplicating content.

A submodule gets added with reference to a **commit** in the external repo. When you update the submodule with the latest external changes, your diff will be small as you have just updated a pointer and not the actual files.

An advantage of a submodule is that you can treat it as a repo. You navigate in it to look around. You use pull in updates. I would avoid trying to make commits of new content in there directly. Rather make them in the external repo in a different part of your machine or on GitHub, then update your submodule and commit the new reference.

As with cloning, you don't have to own a repo to add it as a submodule.

### Benefits

The great thing about submodules:

- It lets you reference other repos in your repo, by commit.
- It keep your commit history short, simple and light. You repo doesn't store all the external files and commits, just a pointer which is small in size.
- You get to lock your repo reference against an external repo, so you get to choose when you pull in changes and thus avoid surprises.

For example:

- If you _add_ a submodule, you only add a single reference to the external commit, as a single object. In Git it is like a file or an alias but it's really a directory because you can pull in content.
- If _update_ a submodule from one commit to hundred commits later and many files changes later, the only change that gets recorded in your repo is change that the module when from one commit reference to another. That's just one file change and one commit that is in your history.

### Why use submodules?

Before submodules existed, you would have to copy the external repo files into your repo and then commit them, causing a huge diff in lines and files added to your repo. And when the external repo changes, you'd be stuck. And you definitely don't want to version repo inside a git repo as that is bad practice. You could copy the external directory into your repo using git clone and add the directory to ignore list. 

But there is no guarantee that the next time you clone you'll get the same content. Having a submodule lock onto a specific external commit makes this reliable. Similar to when you lock a package at v2.3.4 in your Node, Python or Ruby packages.

### When should I use submodules?

A submodule is a way of managing an external dependency reliably. Whether code you wrote or by someone else.

Submodules are usually for when you have just a few dependencies to add and there is no package manager option.
One reason to use submodules is for a theme in a Hugo or MkDocs site. Hugo doesn't use a package manager like other tools do (such as Jekyll or Node). So you have to copy the theme as a directory. Submodules is a light and reliable way to install and update themes. And if you need to change to another theme, you can clone another submodule in its place or next to it. It will take up very little space in version control using just the commit reference.

Maybe you want to pull in content pages or data (rather than a theme or package) from another repo for your static site.

You can also use submodules to collect multiple repos together as a monorepo. Which can be viewed locally or on GitHub. You might have submodules depend on each other such as using a symlink. Or you just view them all in one place.

In Terraform, there is the concept of Terraform modules. These are referenced as repos with version numbers. These get installed for you using traditional cloning in an ignored directory of modules. That does not use submodules, but it achieves the same accuracy by locking a release number in a script. So you don't have to know the submodule system or commit a submodule reference.



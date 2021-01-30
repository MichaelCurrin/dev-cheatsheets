# Submodules


## What are submodules?

A git submodule allows you to put a git repo as a directory inside another git repo, but without inflating the outer repo or duplicating content.

A submodule gets added with reference to a commit in the external repo. When you update the submodule with the latest external changes, your diff will be small as you have just updated a pointer and not
the actual files.

An advantage of a submodule is that you can treat it as a repo. You navigate in it to look around. You use pull in updates. I would avoid trying to make commits of new content in there directly. Rather make them in the external repo in a different part of your machine or on GitHub, then update your submodule and commit the new reference.

As with cloning, you don't have to own a repo to add it as a submodule.


## Why use submodules?

Before submodules existed, you would have to copy the external repo files into your repo and then commit them, causing a huge diff in lines and files added to your repo. And when the external repo changes, you'd be stuck. And you definitely don't want to version repo inside a git repo as that is bad practice. You could copy the external directory into your repo using git clone and add the directory to ignore list. 

But there is no guarantee that the next time you clone you'll get the same content. Having a submodule lock onto a specific external commit makes this reliable. Similar to when you lock a package at v2.3.4 in your Node, Python or Ruby packages.


## When should I use submodules?

A submodule is a way of managing an external dependency reliably. Whether code you wrote or by someone else.

Submodules are usually for when you have just a few dependencies to add and there is no package manager option.
One reason to use submodules is for a theme in a Hugo or MkDocs site. Hugo doesn't use a package manager like other tools do (such as Jekyll or Node). So you have to copy the theme as a directory. Submodules is a light and reliable way to install and update themes. And if you need to change to another theme, you can clone another submodule in its place or next to it. It will take up very little space in version control using just the commit reference.

Maybe you want to pull in content pages or data (rather than a theme or package) from another repo for your static site.

You can also use submodules to collect multiple repos together as a monorepo. Which can be viewed locally or on GitHub. You might have submodules depend on each other such as using a symlink. Or you just view them all in one place.

In Terraform, there is the concept of Terraform modules. These are referenced as repos with version numbers. These get installed for you using traditional cloning in an ignored directory of modules. That does not use submodules, but it achieves the same accuracy by locking a release number in a script. So you don't have to know the submodule system or commit a submodule reference.


## Resources

[Submodules](https://www.atlassian.com/git/tutorials/git-submodule) tutorial in Atlassian docs.


## Example flow

```sh
$ git submodule add https://bitbucket.org/jaredw/awesomelibrary
```

```sh
$ git status
...
 new file:   .gitmodules
 new file:   awesomelibrary
```

Contents of .gitmodules:

```ini
[submodule "awesomelibrary"]
 path = awesomelibrary
 url = https://bitbucket.org/jaredw/awesomelibrary
```

Commit the submodule changes.

```sh
$ git add .gitmodules awesomelibrary/
$ git commit -m "Add submodule"
```

When you clone the outer repo, the submodule references will be included but the directories will be empty.

To download the content, you need to do one of these steps.

```sh
$ git clone URL --recursive
```

That is equivalent to:

```sh
$ git clone URL
$ cd repo
$ git submodule init
$ git submodule update
```


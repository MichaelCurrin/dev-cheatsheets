# Submodules


## What are submodules?

A git submodule allows you to put a git repo as a directory inside another git repo, but without inflating the outer repo or duplicating content.

A submodule gets added with reference to a commit in the external repo. When you update the submodule with the latest external changes, your diff will be small as you have just updated a pointer and not
the actual files.

An advantage of a submodule is that you can treat it as a repo. You navigate in it to look around. You use pull in updates. I would avoid trying to make commits of new content in there directly. Rather make them in the external repo in a different part of your machine or on GitHub, then update your submodule and commit the new reference.

As with cloning, you don't have to own a repo to add it as a submodule.


## Why use submodules?

Before submodules existed, you would have to copy the external repo files into your repo and then commit them, causing a huge diff in lines and files added to your repo. And when the external repo changes, you'd be stuck. And you definitely don't want to version repo inside a git repo as that is bad practice. You could copy the external directory into your repo using git clone and add the directory to ignore list. 

But there is no guarantee that the next time you clone you'll get the same content. Having a submodule lock onto a specific external commit makes this reliable. Similar when you lock a package at v2.3.4 in your Node, Python or Ruby packages.

One reason to use submodules is for a theme in a Hugo site. Hugo doesn't use a package manager like other tools do (such as Jekyll). So you have to copy the theme as a directory. Submodules is a light and reliable way to install and update themes. And if you need to change to another theme, you can clone another submodule in its place or next to it. It will take up very little space in version control using just the commit reference.

Maybe you want to pull in content from another repo for your static site.

You can also use submodules to collect multiple repos together as a monorepo. Which can be viewed locally or on GitHub. You might have submodules depend on each other such as using a symlink. Or you just view them all in one place.


## Resources

[Submodules](https://www.atlassian.com/git/tutorials/git-submodule) tutorial in Atlassian docs.

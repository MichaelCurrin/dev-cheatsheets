---
title: Custom SSH
description: How to a specify an alternate SSH key
---


## SSH key setup

You cannot reuse an SSH public key across GitHub accounts (I got an error adding the key), so then if you want to maintain a repo as a different user, you need a new key.

Generate one as per [SSH keys](https://michaelcurrin.github.io/code-cookbook/recipes/shell/ssh/keys.html) guide.

Assuming a file:

```
~/.ssh/id_rsa_foo
```

Steps below are based on [SO](https://stackoverflow.com/questions/6688655/select-private-key-to-use-with-git).

You'll need to explicitly tell the SSH command to recognize that file.


## Change Git config

Two approaches. One sets the config value on an existing repo and another at the point you clone.

Both work fine and will perist the config value in the local repo config.

Your global config is not affected.

#$# Configure an existing repo

Set up a repo.

```sh
$ git init my-repo
$ cd my-repo
```

Then configure the repo settings.

```sh
$ git config --local core.sshCommand "/usr/bin/ssh -i PRIVATE_KEY_PATH"
```

e.g.

```sh
$ git config --local core.sshCommand "/usr/bin/ssh -i ~/.ssh/id_rsa_foo"
```


### Configure when cloning

This provides the path to a ID RSA file at the time you clone repo.

```sh
$ git clone REPO_SSH_URL \
    --config core.sshCommand="/usr/bin/ssh -i PRIVATE_KEY_PATH" 
```

e.g.

```sh
$ git clone git@github.com:MyUsername/my-repo.git \
    --config core.sshCommand="/usr/bin/ssh -i ~/.ssh/id_rsa_foo" 
$ cd my-repo
```


## Config

Another approach is to set up `~/.ssh/config` as:

```
Host github.com
  IdentityFile ~/.ssh/id_rsa.github
Host heroku.com
  IdentityFile ~/.ssh/id_rsa.heroku
Host *
  IdentityFile ~/.ssh/id_rsa
```
  
The last one is the default.

With a weakness on this approach:

> This idea doesn't work if you have multiple accounts on one server like GitHub, and you want a different private key for each one.

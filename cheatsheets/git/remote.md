---
title: Git remote
---

## New repo

After creating a repo on GitHub

Clone it.

Or add the remote to an existing local git repo.

```sh
git remote add origin git@github.com:MichaelCurrin/cheatsheets.git
```

If there are no commits yet, you won't be able to do  a pull, so you can just commit and push.

If there are commits, you can pull but you need to include the remote name and branch.

```sh
git pull origin master
```

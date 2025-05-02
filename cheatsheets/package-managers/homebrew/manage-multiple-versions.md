# Manage multiple versions

For example, you have multiple versions of Python or Node installed and want to pick which one is active.

Recommended - use NVM to manage Node versions instead.

```sh
$ brew install node@22
$ node -v  # see 23 for example used
$ brew unlink node
$ brew link node@22  # set 22 to active version
$ node -v  # verify
```

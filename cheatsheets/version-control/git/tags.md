# Tags

## Related

- [tag][] command

[tag]: {% link cheatsheets/version-control/git/commands/tag.md %}


## Latest tag

Using [git describe][] command.

[git describe]: {% link cheatsheets/version-control/git/commands/describe.md %}

Shows tag number found, the number of commits back as a number and then a short commit hash.

```sh
$ git describe
v0.19.0-1-gdc17e80
```

Another case for 32 commits back. The hash is `9641372`. The `-g` always seems to appear as a prefix.

```sh
$ git describe
v1.0.2-32-g9641372
```

If the current commit already has a tag, only the tag will be shown.

```sh
$ git checkout gdc17e80
$ git describe
v0.19.0
```

Show just commit reference by setting the hash length to zero.

```sh
$ git describe --abbrev=0
v0.19.0
```

Including tags that are not annotated.

```sh
$ git describe --tags
```

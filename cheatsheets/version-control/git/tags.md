# Tags

## Related

- [tag][] command

[tag]: {% link cheatsheets/version-control/git/commands/tag.md %}


## View latest tag

Using [git describe][] command.

[git describe]: {% link cheatsheets/version-control/git/commands/describe.md %}


## Checkout latest tag

```sh
$ git checkout $(git describe --abbrev=0 --tags)
```

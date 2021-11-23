# Workspaces


- [Workspace command](https://www.terraform.io/docs/commands/workspace/index.html) docs.

Usage:

```sh
$ terraform workspace <subcommand> [options] [args]
```

```sh
$ terraform workspace --help
```
```
Usage: terraform workspace

  New, list, show, select and delete Terraform workspaces.

Subcommands:
    delete    Delete a workspace
    list      List Workspaces
    new       Create a new workspace
    select    Select a workspace
    show      Show the name of the current workspace
```

Example:

```sh
$ WS_NAME=foo
$ terraform workspace select $WS_NAME || terraform workspace new $WS_NAME
```

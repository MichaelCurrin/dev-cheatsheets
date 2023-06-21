# Permissions error

Sometimes the root user will make changes to files in the Git repo in `.git` and change the owner to be `root`. Perhaps when using Windows Subsystem for Linux or Dev Containers (VS Code).

Solution - recursively set permissions to your own user and group.

```sh
$ sudo chmod -R michael:michael .git
```

# log

Docs

Git docs: [git-log](https://git-scm.com/docs/git-log)

## Flags

```
--decorate[=short|full|auto|no]
```

```sh
$ git log --stat
```
```
Author: ...
Date:   Sun Dec 1 18:42:48 2019 -0600

    Add function return expression option

 .gitignore                     |   4 +
 .vscode/extensions.json        |   7 +
 .vscode/launch.json            |  35 ++++
 .vscode/settings.json          |  11 ++
 .vscode/tasks.json             |  20 +++
 .vscodeignore                  |  10 ++
 CHANGELOG.md                   |  18 ++
 LICENSE                        |  21 +++
 README.md                      |  41 +++++
 images/demo.gif                | Bin 0 -> 12980699 bytes
 images/git-prefix-button.gif   | Bin 0 -> 126359 bytes
 images/icon.png                | Bin 0 -> 8167 bytes
 images/prefix-commit.svg       |   1 +
 images/prefix-commit_light.svg |   1 +
 package-lock.json              | 927 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 package.json                   |  99 +++++++++++
 src/api/git.d.ts               | 238 +++++++++++++++++++++++++
 src/extension.ts               |  74 ++++++++
 src/test/extension.test.ts     |  22 +++
 src/test/index.ts              |  23 +++
 tsconfig.json                  |  21 +++
 tslint.json                    |  15 ++
 vsc-extension-quickstart.md    |  35 ++++
 23 files changed, 1623 insertions(+)
```

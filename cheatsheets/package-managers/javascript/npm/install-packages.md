# Install packages

You must create a `package.json` file with `npm init` before you can run installs in a project.


## Install commands

See cheatsheets for:

- [npm install][] command.
- [npm ci][] command for production and automated deploys.

[npm install]: {% link cheatsheets/package-managers/javascript/npm/commands/install.md %}
[npm ci]: {% link cheatsheets/package-managers/javascript/npm/commands/ci.md %}


## Install packages globally

```sh
$ npm install -g PACKAGE
```

### Fix permissions error

You may get a permissions error because you are installing as a user to directories that are shared and owned by root.

- `/usr/lib/node_modules/`
- `/usr/bin`

The `usr` directory is intended for installing and sharing across users.

Here are some ways to fix that:

- Install as the root user.
    - **Warning** avoid doing this. There is a security risk here, as you are giving the package and its dependencies the ability to run scripts with access to your whole machine, to change or read data they shouldn't.
    - Adding `sudo`:
        ```sh
        $ sudo npm install -g PACKAGE
        ```
- Change the owner of the directories to your current user.
    - **Warning** This is fixes the issue for your current user, but if another tries to install there you will get a similar error to before.
    - Command, using recursive flag:
        ```sh
        $ sudo chown -R $USER /usr/lib/node_modules /usr/bin
        ```
- Allow all users to write to the directories.
    - This is a better option than the one above, if you don't want to change the owner of the directory or if you want all users and not just one to have access.
    - **Warning** This will give access for your own user and all other users on the machine.
    - Command to add write access `w` for all users `a`:
        ```sh
        $ sudo chmod a+w /usr/lib/node_modules /usr/bin
        ```
- If you want to give more granular access then above, you could change the group owner of the directories and change the permissions so anyone in the owner group has write access. This means you can target one or more users in a certain group instead of all users.


## View package

You can get info on a package about it from the NPM registry.

```sh
$ npm view @vue/cli
```

```
@vue/cli@4.5.11 | MIT | deps: 35 | versions: 140
Command line interface for rapid Vue.js development
https://cli.vuejs.org/
...
dist-tags:
latest: 4.5.11       next: 5.0.0-alpha.4
```

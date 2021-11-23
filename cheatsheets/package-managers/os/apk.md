# apk

The Alphine Linux package manager.

See [tutorial](https://www.cyberciti.biz/faq/10-alpine-linux-apk-command-examples/).

## Install

```sh
$ apk update
```

```sh
$ apk add sqlite3
$ apk add sqlite3 apache2
```

## Upgrade

```sh
$ apk upgrade
```


## Lock version

```sh
$ apk add bash=5.0.0-r0
$ # Or
$ apk add bash=~5.0
```

Remove lock.

```sh
$ apk add bash>5.0.0-r0
```

## Search

```sh
$ apk search PACKAGE_NAME
```

e.g.

```sh
$ apk search htop
```
```
htop-doc-2.0.2-r0
htop-2.0.2-r0
```

To search and display description:

```sh
$ apk search -v -d 'htop'
```
htop-doc-2.0.2-r0 - An interactive process viewer (documentation)
htop-2.0.2-r0 - An interactive process viewer
```

# Services

Set up a service to start now and then start up whenever you boot the machine. This uses `launchd`.

## Run

> Run the service formula without registering to launch at login (or boot).

```sh
brew services run SERVICE
```

## Start

> Start the service formula immediately and register it to launch at login (or boot).

```sh
brew services start SERVICE
```


## Stop

> Stop the service formula immediately and unregister it from launching at login (or boot), unless --keep is specified.

```sh
brew services stop SERVICE
```

# Colima

Start in the foreground.

```sh
colima start -f
```

Start SSH tunnel.

```sh
colima ssh
```

Run command in the machine.

```sh
colima ssh -- CMD
# e.g.
colima ssh -- sudo cp "/path/to/cert" /usr/local/share/ca-certificates/nscacert.crt
```

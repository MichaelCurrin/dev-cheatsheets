# Raspberry Pi


## Pins CLI help

```sh
$ pinout
```


## IO pins

For the IO, you can use any of the following GPIO numbers:

- `7`
- `11`
- `12`
- `13`
- `15`
- `16`
- `18`
- `22`


## Go compile for Pi

From [article](https://www.thepolyglotdeveloper.com/2017/04/cross-compiling-golang-applications-raspberry-pi/).

```sh
$ GOOS=linux GOARCH=arm GOARM=5 \
  go build
```

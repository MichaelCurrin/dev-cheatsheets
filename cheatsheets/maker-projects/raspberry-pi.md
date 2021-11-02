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

If you want speed of compilation from another machine, you can compile for Pi with options below.

From [article](https://www.thepolyglotdeveloper.com/2017/04/cross-compiling-golang-applications-raspberry-pi/).

```sh
$ GOOS=linux GOARCH=arm GOARM=5 \
  go build
```

Or simply run the command without options on the actual Pi. Defaults will be used.

If you aren't sure of the values, you can also check your Go environment set up on the Pi and then use that other your other machine for compiling.


## Camera

### CLI

Still image:

```sh
$ raspistill -o test.jpg
```

Video:

```sh
$ raspivid -o testv.h264 # five seconds
$ raspivid -o testv.h264 -t 1000 # one second
```

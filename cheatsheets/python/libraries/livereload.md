# Livereload

The built-in `http.server` module works great as a light static file server, but it does not support livereloading (forcing the browser to refresh on file changes).

The `livereload` Python package helps here.

[PyPI](https://pypi.org/project/livereload/)


## Install

```sh
$ pip install livereload
```


## Help

```console
$ livereload -h
usage: livereload [-h] [--host HOST] [-p PORT] [-t TARGET] [-w WAIT] [-o OPEN_URL_DELAY] [-d] [directory]

Start a `livereload` server

positional arguments:
  directory             Directory to serve files from

optional arguments:
  -h, --help            show this help message and exit
  --host HOST           Hostname to run `livereload` server on
  -p PORT, --port PORT  Port to run `livereload` server on
  -t TARGET, --target TARGET
                        File or directory to watch for changes
  -w WAIT, --wait WAIT  Time delay in seconds before reloading
  -o OPEN_URL_DELAY, --open-url-delay OPEN_URL_DELAY
                        If set, triggers browser opening <D> seconds after starting
  -d, --debug           Enable Tornado pretty logging
```

## Usage

### Serve

Current directory.

```sh
$ livereload
```

Target directory.

```sh
$ livereload my-dir
```

Open in the browser at:

- [127.0.0.1:35729/](http://127.0.0.1:35729/)

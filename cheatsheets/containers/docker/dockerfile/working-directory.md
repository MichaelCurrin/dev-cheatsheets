# Working directory

Using `cd` is not persisted across steps.

But setting working directory with `WORKDIR` is.


## Set working directory

This is useful to a working directory for subsequent commands in the image build or container running. Especially if you start in interactive mode and want to start at an appropriate directory.

If the directory does not exist, you must create it using `mkdir.

`Dockerfile`
```Dockerfile
RUN mkdir /root/foo
WORKDIR /root/foo
```

`Dockerfile`
```Dockerfile
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
```

Though, you can set up working directory and then use `COPY` to add something there and the directory will be created, without the need for `mkdir`.

Given `app` in the current directory, the `app` directory will be copied to where the working directory expects it to be.

`Dockerfile`
```Dockerfile
WORKDIR /usr/src/app
COPY . .
```

I read that using absolute paths is preferred in a container over a path like `~/foo`.

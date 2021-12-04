# Copying

## Copy command

Use the `COPY` command directories into an image.

You can copy a file or a directory.

```Dockerfile
COPY SOURCE DESTINATION
```

Note that using `.` or `./` seems to make no difference, when in source or destination.

But sometimes Dockerfile commands are not like the shell - I think a trailing forward slash behaves differently and maying copying directory to a path.


### Examples

Note we leave working directory as `/root/` here so copying to relative path will use that.

#### Copy file

<!-- TODO: research and experiment to check I got these right -->

```Dockerfile
# Copy file to working directory.
COPY foo .
# cp foo /root/foo

COPY foo /root/bar/
# cp foo /root/bar/foo

COPY foo /bar/
# cp foo /bar/foo
```

#### Copy files

```Dockerfile
COPY package*.json .
# i.e.
# cp package.json /root/package.json
# cp package-lock.json /root/package-lock.json

# OR
COPY package.json package-lock.json .
```

#### Copy directories

```Dockerfile
# Copy whole directory.
COPY src .
# cp -r src /root/src
```

```Dockerfile
# Warning.
# If the destination is a directory, the whole directory will be copied INTO the directory.
COPY src fuzz
# i.e.
# mkdir /root/fuzz
# cp -r src /root/fuzz/src
# NOT
# cp -r src /root/fuzz

# Use globstar to copy contents of directory into a new name.
COPY src/* fuzz
# i.e.
# mkdir /root/fuzz/
# cp -r src/* /root/fuzz
```

#### Copy files and directories

```Dockerfile
# Copy files and directories
COPY . .
# cp -r . /root/
```

### Subdirectories

Subdirectories will be created. For example, if `fizz` does not exist.

```Dockerfile
COPY foo /root/fizz/buzz/
```

Then that is equivalent to:

```sh
mkdir -p /root/fizz/buzz/
cp foo /root/fizz/buzz/foo
```

### Absolute path

Using absolute destinations is preferred. So avoid using `~/bar`, though it can actually work to point to the root user's home.

You can also set the working directory in the image before your copy steps, to avoid using the prefix each time.

```Dockerfile
MKDIR /root/app
WORKDIR /root/app

COPY . .
```

Note that this works differently to the plain `cp` command - the contents of the source directory are copied, not the directory itself.

So to keep the destination as `lib`, why you would use `COPY lib lib` rather than `COPY lib .`

### Glob

This won't just copy the directories in `foo`, it will copy the _contents_ of the directories in  `foo`, which is probably not what you want.

```Dockerfile
COPY foo/* .
```

## COPY vs ADD

See also the older `ADD` command which is not used as much. It allows referencing a zip file on a URL, but the preferred way in the docs is to use `curl` and `tar` in a `RUN` command.

See [Add vs Copy](https://phoenixnap.com/kb/docker-add-vs-copy) article.

See in the docs:

- [COPY](https://docs.docker.com/engine/reference/builder/#copy)
- [ADD](https://docs.docker.com/engine/reference/builder/#add)

See also `docker cp` as a CLI command to copy a file into a container rather than using `COPY` for building the image.

Note that the source path is relative to the build context (usually the root of your repo). You **cannot** use any relative or absolute paths outside the context, such as paths like `/`, `..` or `~/`.

If you want to copy from outside the project:

```sh
$ cd ..
$ docker build -t my-app -f src/Dockerfile .
```

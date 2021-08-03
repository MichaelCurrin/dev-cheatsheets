# Copy content
> Copy files/folders between a container and the local filesystem

See [cp](https://docs.docker.com/engine/reference/commandline/cp/) docs.


## Usage

```
docker cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH|-
docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH
```


## Examples

### Copy to container

#### Copy file

```sh
$ docker cp foo.txt my-app:/root/app
# => /root/app/foo.txt
```

#### Copy directory

Copy the entire directory. The name will be kept.

```sh
$ docker cp foo my-app:/root/app
# => /root/app/foo/
```

#### Copy directory contents

Copy contents of directory into a directory. Note using a dot forwardslash in destination, as per the docs.

```sh
$ docker cp foo my-app:/root/app/foo/.
# => /root/app/foo/
```

```sh
$ docker cp foo my-app:/root/app/bar/.
# => /root/app/bar/
```

### Copy from container

```sh
$ docker cp my-app:/root/app foo
# => foo
```

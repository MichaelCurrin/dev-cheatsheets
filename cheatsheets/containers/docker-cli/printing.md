# Printing


Docker image building is quite by default with the new build kit. This hides long install output, but can also mean you `echo` commands for debuggin don't appear.

Here are changes to make, based on [SO][] answers.

[SO]: https://stackoverflow.com/questions/64804749/why-is-docker-build-not-showing-any-output-from-commands


## Progress

```sh
$ docker build --progress plain
```

```
  --progress string         Set type of progress output (auto, plain, tty). Use plain to show container output
```

Or

```sh
$ export BUILDKIT_PROGRESS=plain
```


## Use the classic build engine

Turn off the new buildkit.

```sh
$ DOCKER_BUILDKIT=0 docker build
```

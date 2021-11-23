# Size


## View

```sh
$ docker system df
```

You get a summary of your Docker usage including things like:

- The total size of all images.
- The total size of all containers.
- The local volumes size.
- And the cache.


## Measuring image size on disk

Based on [article](https://semaphoreci.com/blog/2018/03/14/docker-image-size.html).

An image might have a total size of 1GB.

And be made of two layers, of 980MB and 20MB each.

If the first, larger layer is used by another image too, then only the part that is not in common takes up extra space of disk.

If the 20MB layer is first and is the one in common, then 980MB will be needed for the new image.

If no layers are shared with other images, then the total size needed on disk will be 1GB.

Note that when uploading to (and maybe downloading from) Docker Hub, only the layers missing must be transferred. So a really big image could be quick to upload if most of its size comes from layers already on the remote.

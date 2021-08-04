# scp

See [tutorial](https://www.computerhope.com/unix/scp.htm).


## Copy to remote

Copy file.

```sh
$ scp ~/images/foo.jpg my-user@myhost.com:~/my_images
```

Copy files.

```sh
$ scp ~/images/*.jpg my-user@myhost.com:~/my_images
```

Copy directory.

```sh
$ scp -r ~/images my-user@myhost.com:~/my_images
```


## Copy to local

```sh
$ scp my-user@myhost.com:~/my_images/*.jpg ~/images/
```

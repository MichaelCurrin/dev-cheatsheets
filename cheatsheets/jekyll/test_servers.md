# Test servers

The Jekyll server has some enhancements so if you want to test your built site close to production, run these locally or on a staging server.


## Nginx

Using Nginx to test a build Jekyll site.

Install.

```sh
sudo apt-get install nginx
```

Allow HTTP traffic.

```sh
sudo ufw allow http
```

`-a` is recursive and `v` is verbose.

```sh
cd _site
sudo rsync -av * /var/www/html/
```
Note this might exclude dotfiles.

Now open the browser at:

- [http:localhost/](http:localhost/)

Disable:

```sh
sudo systemctl stop nginx
sudo ufw delete allow http
```

## Python

Start a server in `_site` directory.

Optionally set port to `80`.

```sh
cd `_site`
python3 -m http.server 80
```

Now open the browser at:

- [http:localhost/](http:localhost/)

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE5NzEzMjYyNV19
-->
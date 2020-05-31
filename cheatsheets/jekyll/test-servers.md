# Test servers

The Jekyll server has some enhancements which are not like a production server. So to replicate a production environment, run the Jekyll `build` command and then serve that directory using one of the approaches below. Either locally or on a staging server.


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

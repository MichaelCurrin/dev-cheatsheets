# Test


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
sudo rsync -av _site/ /var/www/html/
```

Now open:

- http:localhost

## Python


<!--stackedit_data:
eyJoaXN0b3J5IjpbLTgwODYzMjMyMl19
-->
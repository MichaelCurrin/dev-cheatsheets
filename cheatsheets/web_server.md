# Web server cheatsheet

## Start server

Serve the current directory so it can be viewed in the browser.

```sh
$ python3 -m http.server 8000

$ ruby -run -e httpd . -p 8000

# Port 3000
$ docsify serve

# Port 4000
$ jekyll serve
$ bundle exec jekyll serve

$ php -S 127.0.0.1:8000
```

See this [gist](https://gist.github.com/willurd/5720255) of many examples.


### Apache

#### Linux

```sh
$ sudo systemctl restart apache
```

#### macOS

```sh
$ sudo apachectl restart
```

### Nginx

#### Linux

```sh
$ service nginx status
$ sudo systemctl status nginx
$ sudo systemctl nginx restart
```

[source](https://www.cyberciti.biz/faq/nginx-linux-restart/)


#### macOS

```sh
$ brew install nginx
$ sudo brew services start nginx
$ sudo brew services restart nginx

$ sudo nginx -s stop && sudo nginx
```

[source](https://www.sylvaindurand.org/setting-up-a-nginx-web-server-on-macos/)


## Local files

Open a file in the browser without a web server:

- Root: `file:///`
- My Documents
    - Mac: `file:///Users/myuser/Documents/`
    - Linux: `file:///home/myuser/Documents/`

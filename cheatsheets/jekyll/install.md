# Install

See [gist](https://gist.github.com/MichaelCurrin/c4a748ebae3d64e5052ceaee987c8534).

<script src="https://gist.github.com/MichaelCurrin/c4a748ebae3d64e5052ceaee987c8534.js"></script>


## Ruby 3 fix

You need to install Webrick to avoid an error on serving. 

See issue [#8523](https://github.com/jekyll/jekyll/issues/8523).

Add to `Gemfile` and install:

```sh
$ bundle add webrick
```

You may need to run this too as recommended, but I was fine without it.

```sh
$ bundle update
```

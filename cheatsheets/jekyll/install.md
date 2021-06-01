# Install

See [gist](https://gist.github.com/MichaelCurrin/c4a748ebae3d64e5052ceaee987c8534).

<script src="https://gist.github.com/MichaelCurrin/c4a748ebae3d64e5052ceaee987c8534.js"></script>


## Ruby 3

I did a blog post series on upgrading to Ruby 3 and fixing up Jekyll projects.

- [Upgrade to Ruby 3](https://dev.to/michaelcurrin/series/13019).

In particular, you need to install _Webrick_ to avoid an error on Jekyll serve command. See issue [#8523](https://github.com/jekyll/jekyll/issues/8523). Perhaps this will be fixed in newer versions of Jekyll.

Run this to add the gem to your `Gemfile` and install it.

```sh
$ bundle add webrick
```

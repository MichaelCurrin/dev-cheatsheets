# User directory

Run this in `irb`:

```ruby
puts Gem.user_dir
```

Or run this in the shell:

```sh
$ ruby -r rubygems -e 'puts Gem.user_dir'
```

On macOS and Linux this will be like:

```
~/.gem/ruby/2.7.0
```

The use of `-r` is to import the `rubygems` library before executing the script. I found that shell command and use it but I don't know why `-r` is needed as I get the same result without it.

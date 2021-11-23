# add subcommand

> Adds the specified gem to Gemfile (if valid) and run 'bundle install' in one step.

```sh
$ bundle add GEM VERSION
```

Example:

```sh
$ bundle add jekyll-optional-front-matter
```

Line appended to `Gemfile`:

```ruby
gem "jekyll-optional-front-matter", "~> 0.3.2"
```

Output:

```
Fetching gem metadata from https://rubygems.org/..........
...
Using jekyll-optional-front-matter 0.3.2
```

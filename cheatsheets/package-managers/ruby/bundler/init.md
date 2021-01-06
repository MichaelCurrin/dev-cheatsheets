# Init

Generate a Gemfile.

```sh
$ bundle init [OPTIONS]
```

- `Gemfile` result.
    ```ruby
    # frozen_string_literal: true

    source "https://rubygems.org"

    git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

    # gem "rails"
    ```

Note the file is only readable, you change the permissions first.

```sh
$ chmod +w Gemfile
$ nano Gemfile
```

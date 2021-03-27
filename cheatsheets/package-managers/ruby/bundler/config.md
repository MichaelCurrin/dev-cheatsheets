# Config

```sh
$ bundle config NAME [VALUE]     # Retrieve or set a configuration value
$ bundle config set NAME VALUE   # Sets the given value for the given key
$ bundle config list             # List out all configured settings
```

Make sure to configure Bundle first before installing.

This is common:

```sh
$ bundle config set --local path vendor/bundle
```

That will create - `.bundle/config` file.

Ignore it:

- `.gitignore`
    ```
    .bundle
    ```

In the case of using the frozen or deploy flags, you'll get values added to the config.


## Clean mode

> clean - Whether  Bundler  should  run  bundle  clean  automatically  after  bundle install.


## Deploy mode

Disallow changes to the `Gemfile.lock` file.

Use the deploy option when configuring.

```sh
$ bundle config set deployment true
```

> deployment - Disallow changes to the Gemfile. When the Gemfile is changed and the lockfile has not been updated, running Bundler commands will be blocked.

Previously, you would set this option, which is now deprecated.

```sh
$ bundle install --deployment
```

From the help:

> This option is deprecated in favor of the **deployment** setting.

Notes from [docs](https://bundler.io/guides/deploying.html)

> The `--deployment` flag requires an up-to-date Gemfile.lock to ensure that the testing you have done (in development and staging) actually reflects the code you put into production.
> 
> You can run `bundle check` before deploying your application to make sure that your Gemfile.lock is up-to-date. 
> 
> Note that it will always be up-to-date if you have run bundle install, successfully booted your application (or run your tests) since the last time you changed your Gemfile. 

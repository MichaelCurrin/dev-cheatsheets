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

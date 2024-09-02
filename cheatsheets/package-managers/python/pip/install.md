
# Install


## Help

See also online docs, for example how to use `-e` is covered under [Editable installs](https://pip.pypa.io/en/stable/reference/pip_install/#editable-installs).

```sh
$ pip install --help
```

```
Usage:
  pip install [options] <requirement specifier> [package-index-options] ...
  pip install [options] -r <requirements file> [package-index-options] ...
  pip install [options] [-e] <vcs project url> ...
  pip install [options] [-e] <local project path> ...
  pip install [options] <archive url/path> ...
```


## Install from requirements file

Set the version.

- `requirements.txt` for PyPI:
    ```
    foo>=0.2
    ```
- `requirement.txt` for GitHub:
    ```
    -e git+https://github.com/FooBar/baz.git@master
    ```

Then install from the file.

```sh
$ pip install -r requirements.txt
```


## Install using CLI

Or install the version directly. Note the quotes help to escape characters.

- Install from PyPI:
    ```sh
    $ pip install 'foo>=0.2'
    ```
- Install from GitHub:
    ```
    $ pip install -e git+https://github.com/FooBar/baz.git@master
    ```

You omit a version, though this can be dangerous for upgrading or setting up environments for import projects. If you omit a version, you'll get the latest.

```sh
$ pip install foo
```

But note that command has no version number requested. So if you run the command repeatedly, you won't ever get a new version, except on a fresh install.


## Handle install errors

### Certificate verify failed

I had this where the host works fine the Docker build process fails.

I get this error on the build but it works fine on the host.

> ERROR: Could not install packages due to an OSError: HTTPSConnectionPool(host='files.pythonhosted.org', port=443):
>
> Max retries exceeded with url: /packages/f6/cf/3857a79c39f451a445f9afc836199fde92a942850808f97bcc396ed6dc64/langchain_community-0.2.15-py3-none-any.whl.metadata
>
> (Caused by SSLError(SSLCertVerificationError(1, '[SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: self-signed certificate in certificate chain (_ssl.c:1000)')))

Solution:

```sh
$ pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org ...
```

Or update CA certificates:

```sh
$ apt-get update && apt-get install -y ca-certificates
```

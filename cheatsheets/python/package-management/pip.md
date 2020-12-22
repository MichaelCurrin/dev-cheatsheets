# Pip command

See also [project packages] section of this project and look for pip or Python pages.

[project packages]: {{ site.baseurl }}{% link cheatsheets/package-managers/project-packages.md %}


## Protect global environment

Prevent accidentally installing or upgrading in your user's global Python environment.

In Linux or macOS, set this value in your `~/.bashrc` or `~/.zshrc` file.

```sh
PIP_REQUIRE_VIRTUALENV=true
```

Now, any time you run `pip install` **outside** a virtual environment you'll get an error.

How to force global install:

```sh
$ PIP_REQUIRE_VIRTUALENV=false pip install PACKAGE
```


## Pip commands

- `install PACKAGE`
- `install PACKAGE==VERSION`
- `install PACKAGE --user`
- `install PACKAGE -U|--upgrade`
- `install -r REQUIREMENTS_TXT_PATH`
- `install pip --upgrade`
- `uninstall PACKAGE`



## Ways to access pip

### Outside virtual environment

Run global pip (probably uses Python 2).

```sh
$ pip
```

Run global pip for Python 3.

```sh
$ pip3
```

Or

```sh
$ python3 -m pip
```

Or target a more specific version which is not your system default.

```sh
$ python3.8 -m pip
```

Upgrade pip. If you get permissions errors, as `--user` flag.

```sh
$ PIP_REQUIRE_VIRTUALENV pip install --upgrade pip
# OR
$ PIP_REQUIRE_VIRTUALENV python3 -m pip install --upgrade pip
```

### Within a virtual environment

Run the pip which is in the scope of the environment - this requires the environment to be activated.

```sh
$ source venv/bin/activate
$ pip
```

Even if using Python 3, you won't need to use `pip3` - using `pip` in a virtual environment is fine.

This approach does **not** require the activate step.

```sh
$ venv/bin/pip
```


## Update pip

Keep `pip` and related packages up to date.

```sh
$ pip3 install --upgrade pip setuptools wheel
```

## CLI usage

### Install

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
```
Description:
  Install packages from:

  - PyPI (and other indexes) using requirement specifiers.
  - VCS project urls.
  - Local project directories.
  - Local or remote source archives.

  pip also supports installing from "requirements files", which provide
  an easy way to specify a whole environment to be installed.

```
```
Install Options:
  --no-clean                  Don't clean up build directories.
  -r, --requirement <file>    Install from the given requirements file. This
                              option can be used multiple times.
  -c, --constraint <file>     Constrain versions using the given constraints
                              file. This option can be used multiple times.
  --no-deps                   Don't install package dependencies.
  --pre                       Include pre-release and development versions. By
                              default, pip only finds stable versions.
  -e, --editable <path/url>   Install a project in editable mode (i.e.
                              setuptools "develop mode") from a local project
                              path or a VCS url.
  -t, --target <dir>          Install packages into <dir>. By default this
                              will not replace existing files/folders in
                              <dir>. Use --upgrade to replace existing
                              packages in <dir> with new versions.
  --platform <platform>       Only use wheels compatible with <platform>.
                              Defaults to the platform of the running system.
  --python-version <python_version>
                              The Python interpreter version to use for wheel
                              and "Requires-Python" compatibility checks.
                              Defaults to a version derived from the running
                              interpreter. The version can be specified using
                              up to three dot-separated integers (e.g. "3" for
                              3.0.0, "3.7" for 3.7.0, or "3.7.3"). A major-
                              minor version can also be given as a string
                              without dots (e.g. "37" for 3.7.0).
  --implementation <implementation>
                              Only use wheels compatible with Python
                              implementation <implementation>, e.g. 'pp',
                              'jy', 'cp',  or 'ip'. If not specified, then the
                              current interpreter implementation is used.  Use
                              'py' to force implementation-agnostic wheels.
  --abi <abi>                 Only use wheels compatible with Python abi
                              <abi>, e.g. 'pypy_41'.  If not specified, then
                              the current interpreter abi tag is used.
                              Generally you will need to specify
                              --implementation, --platform, and --python-
                              version when using this option.
  --user                      Install to the Python user install directory for
                              your platform. Typically ~/.local/, or
                              %APPDATA%\Python on Windows. (See the Python
                              documentation for site.USER_BASE for full
                              details.)
  --root <dir>                Install everything relative to this alternate
                              root directory.
  --prefix <dir>              Installation prefix where lib, bin and other
                              top-level folders are placed
  -b, --build <dir>           Directory to unpack packages into and build in.
                              Note that an initial build still takes place in
                              a temporary directory. The location of temporary
                              directories can be controlled by setting the
                              TMPDIR environment variable (TEMP on Windows)
                              appropriately. When passed, build directories
                              are not cleaned in case of failures.
  --src <dir>                 Directory to check out editable projects into.
                              The default in a virtualenv is "<venv
                              path>/src". The default for global installs is
                              "<current dir>/src".
  -U, --upgrade               Upgrade all specified packages to the newest
                              available version. The handling of dependencies
                              depends on the upgrade-strategy used.
  --upgrade-strategy <upgrade_strategy>
                              Determines how dependency upgrading should be
                              handled [default: only-if-needed]. "eager" -
                              dependencies are upgraded regardless of whether
                              the currently installed version satisfies the
                              requirements of the upgraded package(s). "only-
                              if-needed" -  are upgraded only when they do not
                              satisfy the requirements of the upgraded
                              package(s).
  --force-reinstall           Reinstall all packages even if they are already
                              up-to-date.
  -I, --ignore-installed      Ignore the installed packages, overwriting them.
                              This can break your system if the existing
                              package is of a different version or was
                              installed with a different package manager!
  --ignore-requires-python    Ignore the Requires-Python information.
  --no-build-isolation        Disable isolation when building a modern source
                              distribution. Build dependencies specified by
                              PEP 518 must be already installed if this option
                              is used.
  --use-pep517                Use PEP 517 for building source distributions
                              (use --no-use-pep517 to force legacy behaviour).
  --install-option <options>  Extra arguments to be supplied to the setup.py
                              install command (use like --install-option="--
                              install-scripts=/usr/local/bin"). Use multiple
                              --install-option options to pass multiple
                              options to setup.py install. If you are using an
                              option with a directory path, be sure to use
                              absolute path.
  --global-option <options>   Extra global options to be supplied to the
                              setup.py call before the install command.
  --compile                   Compile Python source files to bytecode
  --no-compile                Do not compile Python source files to bytecode
  --no-warn-script-location   Do not warn when installing scripts outside PATH
  --no-warn-conflicts         Do not warn about broken dependencies
  --no-binary <format_control>
                              Do not use binary packages. Can be supplied
                              multiple times, and each time adds to the
                              existing value. Accepts either ":all:" to
                              disable all binary packages, ":none:" to empty
                              the set (notice the colons), or one or more
                              package names with commas between them (no
                              colons). Note that some packages are tricky to
                              compile and may fail to install when this option
                              is used on them.
  --only-binary <format_control>
                              Do not use source packages. Can be supplied
                              multiple times, and each time adds to the
                              existing value. Accepts either ":all:" to
                              disable all source packages, ":none:" to empty
                              the set, or one or more package names with
                              commas between them. Packages without binary
                              distributions will fail to install when this
                              option is used on them.
  --prefer-binary             Prefer older binary packages over newer source
                              packages.
  --require-hashes            Require a hash to check each requirement
                              against, for repeatable installs. This option is
                              implied when any package in a requirements file
                              has a --hash option.
  --progress-bar <progress_bar>
                              Specify type of progress to be displayed
                              [off|on|ascii|pretty|emoji] (default: on)

Package Index Options:
  -i, --index-url <url>       Base URL of the Python Package Index (default
                              https://pypi.org/simple). This should point to a
                              repository compliant with PEP 503 (the simple
                              repository API) or a local directory laid out in
                              the same format.
  --extra-index-url <url>     Extra URLs of package indexes to use in addition
                              to --index-url. Should follow the same rules as
                              --index-url.
  --no-index                  Ignore package index (only looking at --find-
                              links URLs instead).
  -f, --find-links <url>      If a URL or path to an html file, then parse for
                              links to archives such as sdist (.tar.gz) or
                              wheel (.whl) files. If a local path or file://
                              URL that's a directory,  then look for archives
                              in the directory listing. Links to VCS project
                              URLs are not supported.
```
```
General Options:
  -h, --help                  Show help.
  --isolated                  Run pip in an isolated mode, ignoring
                              environment variables and user configuration.
  -v, --verbose               Give more output. Option is additive, and can be
                              used up to 3 times.
  -V, --version               Show version and exit.
  -q, --quiet                 Give less output. Option is additive, and can be
                              used up to 3 times (corresponding to WARNING,
                              ERROR, and CRITICAL logging levels).
  --log <path>                Path to a verbose appending log.
  --proxy <proxy>             Specify a proxy in the form
                              [user:passwd@]proxy.server:port.
  --retries <retries>         Maximum number of retries each connection should
                              attempt (default 5 times).
  --timeout <sec>             Set the socket timeout (default 15 seconds).
  --exists-action <action>    Default action when a path already exists:
                              (s)witch, (i)gnore, (w)ipe, (b)ackup, (a)bort.
  --trusted-host <hostname>   Mark this host or host:port pair as trusted,
                              even though it does not have valid or any HTTPS.
  --cert <path>               Path to alternate CA bundle.
  --client-cert <path>        Path to SSL client certificate, a single file
                              containing the private key and the certificate
                              in PEM format.
  --cache-dir <dir>           Store the cache data in <dir>.
  --no-cache-dir              Disable the cache.
  --disable-pip-version-check
                              Don't periodically check PyPI to determine
                              whether a new version of pip is available for
                              download. Implied with --no-index.
  --no-color                  Suppress colored output
  --no-python-version-warning
                              Silence deprecation warnings for upcoming
                              unsupported Pythons.
```

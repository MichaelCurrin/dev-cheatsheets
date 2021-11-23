# list


## Help

```sh
$ go list -h
```

```
usage: go list [-f format] [-json] [-m] [list flags] [build flags] [packages]
Run 'go help list' for details.
```

From the CLI help docs:

> The -m flag causes list to list modules instead of packages.

> The default output is to print the module path and then
> information about the version and replacement if any.
>
> For example, 'go list -m all' might print:
>
>     my/main/module
>     golang.org/x/text v0.3.0 => /tmp/text
>     rsc.io/pdf v0.1.1

> The -u flag adds information about available upgrades.
> When the latest version of a given module is newer than
> the current one, list -u sets the Module's Update field
> to information about the newer module.
> The Module's String method indicates an available upgrade by
> formatting the newer version in brackets after the current version.
> For example, 'go list -m -u all' might print:
>
>    my/main/module
>    golang.org/x/text v0.3.0 [v0.4.0] => /tmp/text
>    rsc.io/pdf v0.1.1 [v0.1.2]


## Own

```sh
$ go list -m all
```

```
github.com/MichaelCurrin/go-gh-gql
cloud.google.com/go v0.65.0
cloud.google.com/go/bigquery v1.8.0
cloud.google.com/go/datastore v1.1.0
cloud.google.com/go/pubsub v1.3.1
cloud.google.com/go/storage v1.10.0
dmitri.shuralyov.com/gpu/mtl v0.0.0-20190408044501-666a987793e9
github.com/BurntSushi/toml v0.3.1
github.com/BurntSushi/xgb v0.0.0-20160522181843-27f122750802
github.com/census-instrumentation/opencensus-proto v0.2.1
github.com/chzyer/logex v1.1.10
...
```

Or

```sh
$ go list all
```

```
bufio
bytes
compress/bzip2
...
fmt
github.com/MichaelCurrin/go-gh-gql
github.com/shurcooL/githubv4
github.com/shurcooL/graphql
github.com/shurcooL/graphql/ident
github.com/shurcooL/graphql/internal/jsonutil
go/ast
go/format
go/parser
go/printer
go/scanner
go/token
golang.org/x/net/context/ctxhttp
golang.org/x/oauth2
golang.org/x/oauth2/internal
hash
...
vendor/golang.org/x/text/transform
vendor/golang.org/x/text/unicode/bidi
vendor/golang.org/x/text/unicode/norm
```

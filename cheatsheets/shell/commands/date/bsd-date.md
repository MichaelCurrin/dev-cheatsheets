# BSD Date

The `date` command on macOS.


## Samples

### Today

- Default
    ```sh
    $ date
    Wed Aug 26 19:40:21 SAST 2020
    ```
- Unix timestamp.
    ```sh
    $ date '+%s'
    1598463660
    ```
- Date.
    ```sh
    $ date '+%Y-%m-%d'
    2020-08-26
    ```
- Date and time.
    ```sh
    $ date '+%Y-%m-%d %T'
    2020-08-26 19:42:40
    ```

### Difference

Get tomorrow's time - use `-v` to adjust value. See formats.

- Default.
    ```sh
    $ date -v+1d
    Thu Aug 27 19:39:11 SAST 2020
    ```
- Unix timestamp.
    ```sh
    $ date -v+1d '+%s'
    1578085208
    ```

### Target time

```sh
$ date -r 1000000000
Sun Sep  9 03:46:40 SAST 2001
```


## CLI

```sh
$ which date
/bin/date
```

There is no `--help` command but trying it still gives usage.

```
usage: date [-jnRu] [-d dst] [-r seconds] [-t west] [-v[+|-]val[ymwdHMS]] ...
            [-f fmt date | [[[mm]dd]HH]MM[[cc]yy][.ss]] [+format]
```

### Man page

```sh
$ man date
```
```
DATE(1)                   BSD General Commands Manual                  DATE(1)

NAME
     date -- display or set date and time

SYNOPSIS
     date [-jRu] [-r seconds | filename] [-v [+|-]val[ymwdHMS]] ... [+output_fmt]
     date [-jnu] [[[mm]dd]HH]MM[[cc]yy][.ss]
     date [-jnRu] -f input_fmt new_date [+output_fmt]
     date [-d dst] [-t minutes_west]

DESCRIPTION
     When invoked without arguments, the date utility displays the current date and time.  Other-
     wise, depending on the options specified, date will set the date and time or print it in a
     user-defined way.
     ...
```

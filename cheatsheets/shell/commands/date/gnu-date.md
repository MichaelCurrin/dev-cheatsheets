# GNU Date

## Help

- [Man page](https://linux.die.net/man/1/date)

## Samples

On Linux, just use as `date`. On macOS, you'll need to [setup](#setup-on-macos) `gdate` and then use that instead below with the same arguments.

### Today

- Default.
    ```sh
    $ gdate
    Wed Aug 26 19:44:35 SAST 2020
    ```
- Date.
    ```sh
    $ date '+%Y%m%d'
    20200826
    $ date '+%Y-%m-%d'
    2020-08-27
    ```
- Unix Timestamp.
    ```sh
    $ date -d 'Oct 21 1973' +%s
    120002400
    ```
- UTC
    ```sh
    $ date -u
    ```

### Date string

> The `--date=STRING` is a mostly free format human readable date string.

e.g.

```sh
$ date --date 'Sun, 29 Feb 2004 16:21:42 -0800'
$ date --date '2004-02-29 16:21:42'
$ date --date 'next day'
$ date --date 'next Thursday'
$ date --date '09:00 next Fri'
$ date --date ''  # midnight of today
```

> A date string may contain items indicating calendar date, time of day, time zone, day of week, relative time, relative date, and numbers.
>
> An empty string indicates the beginning of the day. The date string format is more complex than is easily documented here but is fully described in the info documentation.

A target Unix Timestamp date.

```sh
$ date --date @120024000
Sun Oct 21 06:00:00 SAST 1973
```

Specify a date string and an output format.

```sh
$ date --date="next day" +%Y-%m-%d
2020-08-27
```

Minutes:

```console
$ date --date='5 minutes ago'
Wed Aug 26 19:44:48 SAST 2020
$ date
Wed Aug 26 19:49:48 SAST 2020
$ date --date='5 minutes'
Wed Aug 26 19:54:48 SAST 2020
```

### Advanced

Copied from `date --help`. Show the local time for 9AM next Friday on the West coast of the US.

```sh
$ date --date='TZ="America/Los_Angeles" 09:00 next Fri'
Fri Aug 28 18:00:00 SAST 2020
```


## Set up on macOS

On macOS, the GNU Linux one can be installed:

```sh
brew rm coreutils && brew install coreutils
```

```sh
$ which gdate
/usr/local/bin/gdate
```

```sh
$ gdate
Wed Aug 26 19:27:24 SAST 2020
```

### Use GNU Linux date on macOS

You can then add an alias to the macOS system uses `gdate` instead.

```sh
alias date=gdate
```

## CLI

```sh
$ date --version # Linux
$ gdate --version # macOS
```
```
date (GNU coreutils) 8.32
Copyright (C) 2020 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
```

```sh
$ man date
```
```
DATE(1)                                    User Commands                                    DATE(1)



NAME
       date - print or set the system date and time

SYNOPSIS
       date [OPTION]... [+FORMAT]
       date [-u|--utc|--universal] [MMDDhhmm[[CC]YY][.ss]]

DESCRIPTION
       Display the current time in the given FORMAT, or set the system date.

       Mandatory arguments to long options are mandatory for short options too.

       -d, --date=STRING
              display time described by STRING, not 'now'
       ...
```

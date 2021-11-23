# Formats

## Full time

Get a standardized ISO date.

```sh
$ date
```
```
Mon 22 Feb 2021 17:58:01 SAST
```

Store it.

```sh
$ CURRENT_TIME=$(date)
$ echo $CURRENT_TIME
```
```
Mon 22 Feb 2021 17:58:01 SAST
```


## Custom format

- Full date.
    ```console
    $ date '+%Y/%m/%d'
    2021/02/22
    ```
- Year only.
    ```console
    $ date '+%Y'
    2021
    ```
- Time only.
    ```console
    $ date '+%H:%M:%S'
    18:34:49
    ```
- Date and time.
    ```sh
    $ date -u +"%Y-%m-%dT%H:%M:%SZ")
    ```
    

## Unix timestamp

Use a built-in variable for current time in seconds.

```console
$ echo $EPOCHSECONDS
1614012035
```

Same as above, but as a float.

```console
$ echo $EPOCHREALTIME
1614012035.3449261189
```

Or use the `date` command.

```console
$ date '+%s'
1614012035
```


## Convert unix timestamp to date and time

Given seconds as a number.

```console
$ date -r 0
Thu  1 Jan 1970 02:00:00 SAST
```

```console
$ date -r 1000000000
Sun  9 Sep 2001 03:46:40 SAST
```



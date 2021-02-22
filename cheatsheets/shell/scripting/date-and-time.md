# Date and time


## Full

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
    ```sh
    date '+%Y/%m/%d'
    ```
    ```
    2021/02/22
    ```
- Year only.
    ```sh
    $ date '+%Y'
    ```
    ```
    2021
    ```


## Convert unix timestamp

Give seconds as a number.

```sh
$ date -r 0
```
```
Thu  1 Jan 1970 02:00:00 SAST
```

```sh
$ date -r 1000000000
```
```
Sun  9 Sep 2001 03:46:40 SAST
```

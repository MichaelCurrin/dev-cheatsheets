# Output format

Examples here use the current time.

See the GNU Date and BSD Date cheatsheets for more info on formats.


## Default format

Get a standardized ISO date by default.

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
    $ date '+%Y-%m-%dT%H:%M:%SZ'
    ```
    
And to store it:

```sh
$ DATE=$(date '+%Y-%m-%dT%H:%M:%SZ')
```






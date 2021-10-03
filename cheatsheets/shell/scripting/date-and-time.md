# Date and time

See [How To Format Date And Time In Linux, MacOS, And Bash?](https://www.shell-tips.com/linux/how-to-format-date-and-time-in-linux-macos-and-bash/).


## Help

macOS:

```sh
$ man date
```
    
<details>
<summary>
    
View output
    
</summary>
    
```
NAME
     date -- display or set date and time

SYNOPSIS
     date [-jRu] [-r seconds | filename] [-v [+|-]val[ymwdHMS]] ... [+output_fmt]
     date [-jnu] [[[mm]dd]HH]MM[[cc]yy][.ss]
     date [-jnRu] -f input_fmt new_date [+output_fmt]
     date [-d dst] [-t minutes_west]

DESCRIPTION
     When invoked without arguments, the date utility displays the current date and time.  Oth-
     erwise, depending on the options specified, date will set the date and time or print it in
     a user-defined way.

     The date utility displays the date and time read from the kernel clock.  When used to set
     the date and time, both the kernel clock and the hardware clock are updated.

     Only the superuser may set the date, and if the system securelevel (see securelevel(7)) is
     greater than 1, the time may not be changed by more than 1 second.
 
...
```
    
</details>
    


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
    

## Unix timestamp

Use a built-in variable for current time in seconds.

```consoe
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


## Examples from docs

On macOS from the manpage.

```
EXAMPLES
```
```
     The command:

           date "+DATE: %Y-%m-%d%nTIME: %H:%M:%S"

     will display:

           DATE: 1987-11-21
           TIME: 13:36:16

     In the Europe/London timezone, the command:

           date -v1m -v+1y

     will display:

           Sun Jan  4 04:15:24 GMT 1998

     where it is currently Mon Aug  4 04:15:24 BST 1997.
```
```
     The command:

           date -v1d -v3m -v0y -v-1d

     will display the last day of February in the year 2000:

           Tue Feb 29 03:18:00 GMT 2000

     So will the command:

           date -v3m -v30d -v0y -v-1m


     because there is no such date as the 30th of February.
```
```
     The command:

           date -v1d -v+1m -v-1d -v-fri

     will display the last Friday of the month:

           Fri Aug 29 04:31:11 BST 1997

     where it is currently Mon Aug  4 04:31:11 BST 1997.
```
```
     The command:

           date 0613162785

     sets the date to ``June 13, 1985, 4:27 PM''.

           date "+%m%d%H%M%Y.%S"

     may be used on one machine to print out the date suitable for setting on another.
```
```
     The command:

           date 1432

     sets the time to 2:32 PM, without modifying the date.

    Finally the command:

           date -j -f "%a %b %d %T %Z %Y" "`date`" "+%s"

     can be used to parse the output from date and express it in Epoch time.
```

# Examples

On macOS, from the manpage.

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

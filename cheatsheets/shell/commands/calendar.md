# calendar

## calendar

CLI help:

```
CALENDAR(1)                                                                              BSD General Commands Manual                                                                              CALENDAR(1)

NAME
     calendar — reminder service

SYNOPSIS
     calendar [-abw] [-A num] [-B num] [-l num] [-e num] [-f calendarfile] [-t [[[cc]yy]mm]dd]
...
```

Description:

> The calendar utility checks the current directory or the directory specified by the CALENDAR_DIR environment variable for a file named calendar and displays lines that begin with either today's date
> or tomorrow's.  On Fridays, events on Friday through Monday are displayed.

Sample output on 6 June:

```console
$ calendar
alendar
Jun 06* Whitmonday
Jun 06  First drive-in movie, 1933
...
Jun 07  Bonne fête aux Gilbert !
Jun 07  Róbert
```

## cal

CLI help:

```
NAME
     cal, ncal — displays a calendar and the date of Easter

SYNOPSIS
     cal [-31jy] [-A number] [-B number] [-d yyyy-mm] [[month] year]
     cal [-31j] [-A number] [-B number] [-d yyyy-mm] -m month [year]
     ncal [-C] [-31jy] [-A number] [-B number] [-d yyyy-mm] [[month] year]
     ncal [-C] [-31j] [-A number] [-B number] [-d yyyy-mm] -m month [year]
     ncal [-31bhjJpwySM] [-A number] [-B number] [-H yyyy-mm-dd] [-d yyyy-mm] [-s country_code] [[month] year]
     ncal [-31bhJeoSM] [-A number] [-B number] [-d yyyy-mm] [year]
...
```

Description:

> The cal utility displays a simple calendar in traditional format and ncal offers an alternative layout, more options and the date of Easter.  The new format is a little cramped but it makes a year fit
> on a 25x80 terminal.  If arguments are not specified, the current month is displayed.

Sample output:

```console
$ cal
     June 2022        
Su Mo Tu We Th Fr Sa  
          1  2  3  4  
 5  6  7  8  9 10 11  
12 13 14 15 16 17 18  
19 20 21 22 23 24 25  
26 27 28 29 30        
```               
        

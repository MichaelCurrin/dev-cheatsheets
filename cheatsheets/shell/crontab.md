# Crontab cheatsheet


## CLI

On macOS:

```
NAME
     crontab -- maintain crontab files for individual users (V3)

SYNOPSIS
     crontab [-u user] file
     crontab [-u user] { -l | -r | -e }

DESCRIPTION
     The crontab utility is the program used to install, deinstall or list the tables used to drive the cron(8) daemon in Vixie Cron.  Each user can have their
     own crontab, and they are not intended to be edited directly.

...

The first form of this command is used to install a new crontab from some named file or standard input if the pseudo-filename `-' is given.

...

The following options are available:

-u      Specify the name of the user whose crontab is to be tweaked.  If this option is not given, crontab examines ``your'' crontab, i.e., the crontab of
       the person executing the command.  Note that su(1) can confuse crontab and that if you are running inside of su(1) you should always use the -u
       option for safety's sake.

-l      Display the current crontab on standard output.

-r      Remove the current crontab.

-e      Edit the current crontab using the editor specified by the VISUAL or EDITOR environment variables.  The specified editor must edit the file in
       place; any editor that unlinks the file and recreates it cannot be used.  After you exit from the editor, the modified crontab will be installed
       automatically.
```

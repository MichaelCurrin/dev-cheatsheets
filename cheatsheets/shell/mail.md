---
title: Mail
description: Using the mail command-line utility on Unix systems
---

Send and receive mails on the command-line.

This is useful for running crontab commands and mailing successes and failures (or just failures) to localhost's mailbox if `MAILTO` is set to a username.


## Help

- [mail](https://www.unix.com/man-page/osx/1/mail/) manpage for macOS.

### Paths

```
     /var/mail/*		 Post office.
     ~/mbox			 User's old mail.
     ~/.mailrc			 File giving initial mail commands.  This can be overridden by setting the MAILRC environment variable.
     /tmp/R*			 Temporary files.
     /usr/share/misc/mail.*help  Help files.

     /usr/share/misc/mail.rc
     /usr/local/etc/mail.rc
     /etc/mail.rc		 System-wide initialization files.  Each file will be sourced, in order, if it exists.
```


## Install

- Debian/Ubuntu
    ```sh
    $ sudo apt install mailutils
    ```

I have `mail` installed on macOS too. Perhaps standard or installed with coreutils.


## Run

View help.

```sh
$ man mail
```

Start interactive session. Press enter to advanced through mail. Enter a number to view that mail.

```sh
$ mail
```

Exit:

```
? q
````

Delete mail.

```
? d 2
```

Delete all.

```
? d *
```

### Sending mail

#### Recipients

You can send to yourself or another user by setting as target `my-user`, which is the same as `my-user@localhost`.

Alternatively, send to external address (e.g. example@example.com), however, you will have to configure an SMTP server with credentials, such using your Gmail account. Be careful when storing your email password in plain text on your machine.

How to setup SMTP server access to send mail over the network.
- https://hints.macworld.com/article.php?story=20081217161612647
- https://www.mactricksandtips.com/2008/09/send-mail-over-your-network.html


#### Send

Single line:

```sh
$ echo "This is the body" | mail -s "My subject" $USER
```

Multi-line:

mail -s "My subject" $USER <<EOF
This is
the body
EOF


## Storage

Where mail is stored.

Mail is stored here when it is read.
```sh
$ view /var/mail/$USER
```

Then moved here once it is read.

```sh
$ view ~/mbox
```



## Alternatives

See also `mutt` command.

[discussion](https://apple.stackexchange.com/questions/44764/is-there-a-command-line-mail-program-for-mac)

```sh
$ brew install mutt
```

Or Postfix.

[post](https://budiirawan.com/install-mail-server-mac-osx/)

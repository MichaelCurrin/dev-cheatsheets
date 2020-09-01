---
title: Mail
description: Using the mail command-line utility on Unix systems
---

Send and receive mails on the command-line, for Linux and macOS.


```sh
$ mail
```

Located at `/usr/bin/mail`, at least on macOS.

Without setting up an SMTP server like Gmail, you can get the benefit of localhost mails for logging. Such shen running crontab commands and mailing successes and failures (or just failures) to localhost's mailbox (if `MAILTO` is set to a username).


## Help

- [mail](https://www.unix.com/man-page/osx/1/mail/) manpage for macOS.


## Install

- Debian/Ubuntu
    ```sh
    $ sudo apt install mailutils
    ```

I have `mail` installed on macOS too. Perhaps standard or installed with coreutils.


## Run

### Help

View help.

```sh
$ man mail
```

### Interactive

Start interactive session. 

Press enter to advanced through mail. Enter a number to view that mail.

```sh
$ mail
```

Sample output:

```sh
$ mail
Mail version 8.1 6/6/93.  Type ? for help.
"/var/mail/mcurrin": 7 messages 7 unread
>U  1 mcurrin@C02WL0Y2HV2T  Sun Aug 30 15:36  15/739   "Unicron task failed!"
 U  2 mcurrin@C02WL0Y2HV2T  Tue Sep  1 10:39  15/739   "Unicron task failed!"
?
```

Exit.

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

### Read mail

Read mail and exit.

```sh
$ mail -H
Mail version 8.1 6/6/93.  Type ? for help.
"/var/mail/mcurrin": 7 messages 7 unread
>U  1 mcurrin@C02WL0Y2HV2T  Sun Aug 30 15:36  15/739   "Unicron task failed!"
 U  2 mcurrin@C02WL0Y2HV2T  Tue Sep  1 10:39  15/739   "Unicron task failed!"
```

### Send mail

#### Recipients

You can send to yourself or another user by setting as target `my-user`, which is the same as `my-user@localhost`.

Alternatively, send to external address (e.g. example@example.com), however, you will have to configure an SMTP server with credentials, such using your Gmail account. Be careful when storing your email password in plain text on your machine.

How to setup SMTP server access to send mail over the network.
- [article](https://hints.macworld.com/article.php?story=20081217161612647)
- [Send mail over your network](https://www.mactricksandtips.com/2008/09/send-mail-over-your-network.html)

#### Send

Single line:

```sh
$ echo "This is the body" | mail -s "My subject" $USER
```

Multi-line:

```
$ mail -s "My subject" $USER <<EOF
This is
the body
EOF
```

### Storage

Where mail is stored.

Mail is stored here when it is read.

```sh
$ view /var/mail/$USER
```

Then moved here once it is read.

```sh
$ view ~/mbox
```


From the man page:

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

## Alternatives

See also `mutt` command.

[discussion](https://apple.stackexchange.com/questions/44764/is-there-a-command-line-mail-program-for-mac)

```sh
$ brew install mutt
```

Or Postfix.

[post](https://budiirawan.com/install-mail-server-mac-osx/)

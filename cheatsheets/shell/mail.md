---
description: Using the mail command-line utility on Unix systems
---
# Mail


Send and receive mails on the command-line, for Linux and macOS.

```sh
$ mail
```

Mail is located at `/usr/bin/mail` on macOS and Linux.

Without setting up an SMTP server like Gmail, you can get the benefit of localhost mails for logging. Such shen running crontab commands and mailing successes and failures (or just failures) to localhost's mailbox (if `MAILTO` is set to a username).


## Help

### Usage

There is no `--help` but you use a bad flag you'll get this:

```
Usage: mail [-EiInv] [-s subject] [-c cc-addr] [-b bcc-addr] [-F] to-addr ...
       mail [-EHiInNv] [-F] -f [name]
       mail [-EHiInNv] [-F] [-u user]
       mail -e [-f name]
       mail -H
```

### Man page

View help.

```sh
$ man mail
```

See online at [mail](https://www.unix.com/man-page/osx/1/mail/) manpage for macOS.

Some highlights:

```
     -E      Do not send messages with an empty body.  This is useful for piping errors from
             cron(8) scripts.

     -e      Test for the presence of mail in the (by default, system) mailbox.  An exit
             status of 0 is returned if it has mail; otherwise, an exit status of 1 is
             returned.

     -H      Write a header summary only.
```

### Interactive mode usage

Output from running `?` help command in interactive mode:

```
? ?
    Mail   Commands
t <message list>                type messages
n                               goto and type next message
e <message list>                edit messages
f <message list>                give head lines of messages
d <message list>                delete messages
s <message list> file           append messages to file
u <message list>                undelete messages
R <message list>                reply to message senders
r <message list>                reply to message senders and all recipients
pre <message list>              make messages go back to /var/mail
m <user list>                   mail to specific users
q                               quit, saving unresolved messages in mbox
x                               quit, do not remove system mailbox
h                               print out active message headers
!                               shell escape
cd [directory]                  chdir to directory or home if none given

A <message list> consists of integers, ranges of same, or user names separated
by spaces.  If omitted, Mail uses the last message typed.

A <user list> consists of user names or aliases separated by spaces.
Aliases are defined in .mailrc in your home directory.
```

## Directories

Relevant directories:

- `/usr/bin/mail`
- `/var/mail/michael` or your username
- `~/mbox`


## Install

### Debian/Ubuntu

Install.

```sh
sudo apt-get install mailutils
```

You'll get prompted for configuration on first install. You can pick localhost if you only need to use it for crontab mails and don't need a server.

Note that the user's mailbox cannot be created without root access.

You'll get this error each time:

```sh
$ mail
```
```
Cannot open mailbox /var/mail/michael: Permission denied
No mail for michael
```

So run this:

```sh
$ sudo touch /var/mail/michael
$ sudo chown michael /var/mail/michael
```

Now you can run `mail`.

### macOS

I have `mail` installed on macOS too. Perhaps standard or installed with coreutils.

TBC


## Run

### Interactive

Start interactive session.

Press enter to advanced through mail. The prompt will change to `?` and a point at `>` for the current position.

```sh
$ mail
```

Sample output:

```sh
$ mail
```
```
Mail version 8.1 6/6/93.  Type ? for help.
"/var/mail/mcurrin": 7 messages 7 unread
>U  1 mcurrin@C02WL0Y2HV2T  Sun Aug 30 15:36  15/739   "Unicron task failed!"
 U  2 mcurrin@C02WL0Y2HV2T  Tue Sep  1 10:39  15/739   "Unicron task failed!"
 ...
 N  6 mcurrin@C02WL0Y2HV2T  Tue Sep  1 13:33  14/729   "Unicron task failed!"
?
```

```sh
$ mail
```
```
Mail version 8.1 6/6/93.  Type ? for help.
"/var/mail/mcurrin": 6 messages 1 new 6 unread
 U  1 mcurrin@C02WL0Y2HV2T  Tue Sep  1 11:02  15/739   "Unicron task failed!"
 U  2 mcurrin@C02WL0Y2HV2T  Tue Sep  1 12:00  20/765   "Cron <mcurrin@C02WL0Y2HV2T> echo Testing!"
 U  3 mcurrin@C02WL0Y2HV2T  Tue Sep  1 12:05  15/739   "Unicron task failed!"
 U  4 mcurrin@C02WL0Y2HV2T  Tue Sep  1 12:34  15/739   "Unicron task failed!"
 U  5 mcurrin@C02WL0Y2HV2T  Tue Sep  1 13:01  15/739   "Unicron task failed!"
>N  6 mcurrin@C02WL0Y2HV2T  Tue Sep  1 13:33  14/729   "Unicron task failed!"
```

Enter a number and press to view that mail or just press enter. Press it repeatedly. Press spacebar to jump to end of mail.

After you read a mail it becomes read. And will be moved out the mailbox.

Exit.

```
? q
```

#### Delete

Delete target mail.

```
? d 2
```

Delete all.

```
? d *
```

### Check mail status

See [Man page](#man-page) section of this page.

```sh
$ mail -e && echo 'You have mail' || echo 'Mailbox is empty'
```

Warning - if there is a permissions error or `mail` is not installed, you'll also get the latter message.

Note that after mail is read, it is archived, but just moved from one [storage](#storage) space to another.

### Read mail

You will get notified in a terminal window when you have unread mail. When a new tab starts or you press enter.

There is an interval value for this which I think defaults to 60 for one hour.

Use this command to display status, show mail list summary and exit.

```sh
$ mail -H
```
```
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

Send a mail to yourself using address as one of:

- Your username e.g. `michael` or `$USER`
- Local address e.g. `michael@localhost`
- System address (host is setup on installing `mailutils`) e.g. `michael@dell-lite`

Single line:

```sh
$ echo "This is the body" | mail -s "My subject" $USER
```

Multi-line using a Bash heredoc setup using a pair of `EOF` characters.

```
$ mail -s "My subject" $USER <<EOF
This is
the body
EOF
```

If you omit the message, you'll be prompted for it. You can use <kbd>CTRL</kbd>+<kbd>D</kbd> to trigger the EOF character. Press <kbd>enter</kbd> to skip over `Cc`.

```sh
$ mail michael@dell-lite
```
```
Cc:
Subject: Mail to self
My content

```

Read it:

```sh
$ mail
```
```
"/var/mail/michael": 2 messages 1 new 1 unread
 U   1 Mail Delivery Syst Mon Nov 16 16:35  73/2216  Undelivered Mail Returned to Sender
>N   2 Michael            Mon Nov 16 16:43  15/429   Mail to self
```

```
? 2
```
```
Return-Path: <michael@dell-lite>
X-Original-To: michael@dell-lite
Delivered-To: michael@dell-lite
Received: by dell-lite (Postfix, from userid 1000)
        id 3550D25E1744; Mon, 16 Nov 2020 16:43:25 +0200 (SAST)
To: <michael@dell-lite>
Subject: Mail to self
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20201116144325.3550D25E1744@dell-lite>
Date: Mon, 16 Nov 2020 16:43:25 +0200 (SAST)
From: Michael <michael@dell-lite>

My content
```

```
? q
```
```
Saved 1 message in /home/michael/mbox
Held 1 message in /var/mail/michael
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

---
title: Mail
---

Using the mail command-line utility on Unix systems.

## Install

```sh
$ sudo apt install mailutils
```

## Run


View help.

```sh
$ man mail
```

Start interactive session.
```sh
$ mail
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
- http://hints.macworld.com/article.php?story=20081217161612647
- http://www.mactricksandtips.com/2008/09/send-mail-over-your-network.html


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

# Fix WSL time

I had an issue where the WSL date and time was out by about a day, while the Windows host was fine.

Check the value is correct with:

```console
> date
Mon Oct 30 22:24:21 CET 2023
```


## HW Clock

I found this on Rix AI tool and it worked for me:

```sh
$ sudo hwclock -s
```


## NTP

Install ntpdate:

```sh
sudo apt install ntpdate
```


Then run to sync with a public NTP server

```sh
sudo ntpdate pool.ntp.org
```

Or add a cron job to sync periodically:

```
* * * * * sudo ntpdate pool.ntp.org
```

Alternatively, based on GitHub:

```sh
sudo ntpdate time.windows.com
sudo service hwclock.sh reload
```


## Restart WSL

```sh
wsl --shutdown
wsl
```


## GitHub issue

The datetime going out of sync was reported in 2020 - [#5324](https://github.com/microsoft/WSL/issues/5324).

Here is a comment in 2023:


> For those who are still struggling in October 2023, doing both of the following will solve the problem and save you from manually syncing every time.
>
> - [Set up Windows Task Scheduler - schtasks](https://stackoverflow.com/a/65086857)
> - [Set up systemd-timesyncd](https://github.com/microsoft/WSL/issues/8204#issuecomment-1338334154)
>
> But I agree it is still a bug.

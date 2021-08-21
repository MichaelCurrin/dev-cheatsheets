---
title: curl

cli:
  usage: |
     curl [options...] <url> 
  flags:
    - flag: '-I, --head'
      description: |
        Show headers only
    
        "Show document info only"
    - flag: '-v'
      description: Verbose
    - flag: '-L'
      description: Follow redirects.
    - flag: '-H, --header HEADER'
      description: Request headers. 
      example: |
        -H 'Content-Type: application/json'
    - flag: '-X, --request TYPE'
      description: Request type. Note that passing data with `-d` automatically generates a POST.
      example: |
        -X POST 
    - flag: '-d, --data DATA'
      description: Pass data in a request. Typically JSON or form data in a POST.
      example: |
        --data 'foo=bar;bazz=123
  
        --data '{"foo": "bar", "bazz": 123}' -H 'Content-Type: application/json'
    - flag: '-F FIELD=VALUE'
      description: Send field
      example: |
        -F 'foo=bar' 'bazz=123'
    - flag: '-u, --user USER:PASSWORD
      description: Server user and password
    - flag: '-A, --user-agent NAME'
      description: Send User-Agent
      example: curl -A "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/81.0" https://example.com/"
---


## Resources

- [curl](https://linux.die.net/man/1/curl) manpage on Linux Die site.


## Help

  
```console
$ curl --help
  Usage: curl [options...] <url>
     --abstract-unix-socket <path> Connect via abstract Unix domain socket
     --alt-svc <file name> Enable alt-svc with this cache file
     ...
```
  
```console
$ man curl
NAME
       curl - transfer a URL

SYNOPSIS
       curl [options / URLs]

DESCRIPTION
       curl  is a tool to transfer data from or to a server, using one of the supported protocols (DICT, FILE, FTP, FTPS, GOPHER, HTTP, HTTPS,
       IMAP, IMAPS, LDAP, LDAPS, POP3, POP3S, RTMP, RTSP, SCP, SFTP, SMB, SMBS, SMTP, SMTPS, TELNET and TFTP). The command is designed to work
       without user interaction.

       curl  offers  a busload of useful tricks like proxy support, user authentication, FTP upload, HTTP post, SSL connections, cookies, file
       transfer resume, Metalink, and more. As you will see below, the number of features will make your head spin!

       curl is powered by libcurl for all transfer-related features. See libcurl(3) for details.
...
```
  

## Usage
  
```
{{ page.cli.usage }}
```
  
  
## Upload file
  
  ```sh
curl -F 'upload=@./my_file.txt' URL
```
  
  
```sh
curl -F 'image=@./my_image.png' URL
```
  
  

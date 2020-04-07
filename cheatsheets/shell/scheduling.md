# Scheduling

See [crontab](https://github.com/MichaelCurrin/learn-to-code/blob/master/Shell/Scheduling/crontab.md) guide.


Send stdout and stderror to stdout and mail the result. Useful in a cronjob. Note this assumes global mail is disabled with `MAILTO=''`.

```sh
RESULT="$(cd DIR && COMMAND)"; [[ $? -ne 0 ]] || echo "$RESULT" | mail -s 'Task foo failed!' $USER
```

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTkxNjg2MzcwMV19
-->
# Parameter expansion

From [guide](https://wiki.bash-hackers.org/syntax/pe).

Some syntax like `^` is only for new Bash and not Bash 3 or ZSH>

```
Simple usage
  $PARAMETER
  ${PARAMETER}
Indirection
  ${!PARAMETER}
Case modification
  ${PARAMETER^}
  ${PARAMETER^^}
  ${PARAMETER,}
  ${PARAMETER,,}
  ${PARAMETER~}
  ${PARAMETER~~}
Variable name expansion
  ${!PREFIX*}
  ${!PREFIX@}
Substring removal (also for filename manipulation!)
  ${PARAMETER#PATTERN}
  ${PARAMETER##PATTERN}
  ${PARAMETER%PATTERN}
  ${PARAMETER%%PATTERN}
Search and replace
  ${PARAMETER/PATTERN/STRING}
  ${PARAMETER//PATTERN/STRING}
  ${PARAMETER/PATTERN}
  ${PARAMETER//PATTERN}
String length
  ${#PARAMETER}
Substring expansion
  ${PARAMETER:OFFSET}
  ${PARAMETER:OFFSET:LENGTH}
Use a default value
  ${PARAMETER:-WORD}
  ${PARAMETER-WORD}
Assign a default value
  ${PARAMETER:=WORD}
  ${PARAMETER=WORD}
Use an alternate value
  ${PARAMETER:+WORD}
  ${PARAMETER+WORD}
Display error if null or unset
  ${PARAMETER:?WORD}
  ${PARAMETER?WORD}
```

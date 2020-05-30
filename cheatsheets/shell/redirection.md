# Redirection cheatsheet

- [Bash redirections cheatsheet]([https://catonmat.net/ftp/bash-redirections-cheat-sheet.pdf](https://catonmat.net/ftp/bash-redirections-cheat-sheet.pdf))
- [Bash one-liners tutorial](https://catonmat.net/bash-one-liners-explained-part-three)


### Running

Use a dash.

```sh
cat script.sh | bash -
```
Or.
```
bash < my_script.sh
```

Or

```
bash my_script.sh
```

Or to persist changes like directory change, env variables and virtual env.

```sh
source my_script.sh
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMzc3MjczMDUsLTE2MDk1MDM2NjZdfQ==
-->
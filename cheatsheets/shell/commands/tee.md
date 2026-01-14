# tee

The `tee` command is used to store and view (pipe) the output of any other command at the same time.

## 1. Basic Syntax
```bash
command | tee [options] [file_name]

```

## Common Usage Examples

### Write to a file and see output

Redirect output to a file while still seeing it in the terminal.

```bash
ls -l | tee output.txt
```

### Append to an existing file

By default, `tee` overwrites files. Use `-a` to append instead.

```bash
echo "New log entry" | tee -a log.txt
```

### Write to multiple files

You can broadcast the output to several files at once.

```bash
echo "Config update" | tee file1.txt file2.txt file3.txt
```

### Use with sudo

Useful when you need to write to a file that requires root permissions, but the redirection operator `>` would fail.

```bash
echo "127.0.0.1 special.host" | sudo tee -a /etc/hosts
```

## Options Reference

| Option | Long Version | Description |
| --- | --- | --- |
| `-a` | `--append` | Append to the given files, do not overwrite. |
| `-i` | `--ignore-interrupts` | Ignore interrupt signals (like Ctrl+C). |
| `-p` |  | Diagnose errors writing to non-pipes. |
| `--version` |  | Output version information and exit. |
| `--help` |  | Display help and exit. |

## Advanced Patterns

### Redirect to another command

Pipe the output to another process while saving the intermediate result.

```bash
cat data.txt | tee backup.txt | grep "Error"
```

### Hide terminal output

If you want to write to a file and a pipe but don't want to see it in the terminal, redirect `stdout` to `/dev/null`.

```bash
command | tee log.txt > /dev/null
```

### Capture Stderr and Stdout

To capture everything (errors and regular output) into a file and the screen:

```bash
command 2>&1 | tee all_output.txt
```

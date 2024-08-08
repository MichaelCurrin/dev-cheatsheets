---
description: Working with Processes in Bash
---
# Processes


## Overview

Here's an example workflow:

1. List all processes:
   ```bash
   ps aux
   ```
   or
   ```bash
   top
   ```
   or
   ```bash
   htop
   ```

2. Filter processes by name:
   ```bash
   ps aux | grep process_name
   ```
   or use `top`/`htop` with filters to search for the process. It can be killed from there too.
3. Find the PID of the process using `pgrep`:
   ```bash
   pgrep process_name
   ```
   or note the PID from `top`/`htop`.
4. Stop the process:
   ```bash
   kill process_id
   ```
5. If the process doesn't stop, force kill it:
   ```bash
   kill -9 process_id
   ```

Always exercise caution when stopping or killing processes, especially system processes, as it may lead to unintended consequences.

## List Processes

### Non-interactive

To list all processes running on the system, use the `ps` command:

```bash
ps aux
```

This will display a list of processes with details like process ID (PID), user, CPU and memory usage, and the command that started the process.

### Interactive

`top` and `htop` provide an interactive interface to monitor processes, CPU and memory usage, and other system information.

You can use `top` (builtin) or `htop` (3rd-party) to get a real-time view of running processes:

```bash
top
```

```bash
htop
```

Press <kbd>q</kbd> to exit.


## Filtering Processes

You can filter the output of `ps` using `grep`. For example, to filter processes by name:

```bash
ps aux | grep process_name
```

Replace `process_name` with the actual name of the process you want to filter.

e.g.

```console
> ps aux | grep redis
michael.currin   21896   0.1  0.0 411066704   1712 s000  S+   Mon03PM   1:29.69 redis-server *:6379
michael.currin   46092   0.0  0.0 410774336    560 s013  S+   Tue04PM   0:00.10 redis-cli
michael.currin   71866   0.0  0.0 410059824    240 s004  R+    9:25AM   0:00.00 grep redis
```

Alternatively, you can use `pgrep` to find the PID of a process by name:

```bash
pgrep process_name
```

This will return the PID(s) of the process(es) matching the given name.

e.g.

```console
> pgrep redis
21896
46092
```

## Stopping or Killing Processes

To stop or kill a process, you need to know its PID. You can use the `kill` command followed by the PID:

```bash
kill process_id
```

This will send a termination signal to the process. If the process doesn't terminate gracefully, you can use the `-9` option to force kill it:

```bash
kill -9 process_id
```

Alternatively, you can use the `pkill` command to kill a process by name:

```bash
pkill process_name
```

Be careful when killing processes, as it may lead to data loss or system instability if critical processes are terminated.

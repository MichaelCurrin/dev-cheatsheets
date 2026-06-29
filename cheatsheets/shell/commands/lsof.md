# lsof

Here is a practical, scannable `lsof` (List Open Files) cheatsheet designed to help you hunt down ghost processes, blocked ports, and rogue database connections.

## The Essentials

| Command | What it Does |
| --- | --- |
| `lsof` | List **all** open files on the system (Warning: Huge output). |
| `lsof -u <username>` | List all files opened by a **specific user**. |
| `lsof -c <program>` | List files opened by a **specific process/command** (e.g., `lsof -c postgres`). |
| `lsof +D /path/to/dir` | List all open files inside a **specific directory** (recursively). |

## Network and port hunting

Crucial for tracking down database connections and network leaks.

* **Find what is running on a specific port:**
  ```bash
  lsof -i :5432
  ```
  * **List all established TCP connections:**
  ```bash
  lsof -i TCP -s TCP:ESTABLISHED
  ```
* **List all listening ports (IPv4 and IPv6):**
  ```bash
  lsof -i -P -n | grep LISTEN
  ```


*(The `-P` flag forces port numbers instead of service names, and `-n` stops DNS resolution to speed up the command).*

## Advanced filtering and logic

By default, combining flags in `lsof` acts as an **OR** operation. To turn it into an **AND** operation, use the `-a` flag.

* **Find network connections belonging ONLY to a specific user (AND logic):**
  ```bash
  lsof -a -u <username> -i
  ```
* **List everything EXCEPT a specific user (using `^`):**
  ```bash
  lsof -u ^root
  ```


## 4. The kill switch

When a ghost process refuses to die and is holding a port hostage, you can extract just the Process ID (PID) using the `-t` (terse) flag and terminate it.

* **Find only the PID running on port 5432:**
  ```bash
  lsof -t -i :5432
  ```

* **Nuke whatever is holding that port hostage:**
  ```bash
  kill -9 $(lsof -t -i :5432)
  ```



> 💡 **Pro-Tip:** If you are investigating files or ports owned by other users or system daemons (like `postgres` or `nginx`), always prepend `sudo` to ensure `lsof` has the permissions to see them.

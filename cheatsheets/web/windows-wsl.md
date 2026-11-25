# Windows WSL

## WSL shell commands

Here is a concise set of everyday WSL commands built around `wsl` and `wsl --shutdown`:

* **Inspect and launch:** Check installed distributions and start a specific one instead of the default.
* **Reset and update:** Terminate a single distribution or update WSL itself.
* **Backup and clean up:** Export a distribution to an archive or unregister one to reclaim disk space.

### Daily control

```powershell
wsl --list --verbose
wsl -d Ubuntu
wsl --terminate Ubuntu
wsl --update
```

### Backup and cleanup

```powershell
wsl --export Ubuntu ubuntu-backup.tar
wsl --import UbuntuNew .\UbuntuNew\ ubuntu-backup.tar
wsl --unregister UbuntuOld
```

## Disable WSL accessing Windows drives
Automount in `/etc/wsl.conf` controls all fixed Windows drives per WSL distribution, not `C:` alone, and requires restarting WSL.

### Disable access

1. In WSL, run `sudo nano /etc/wsl.conf` and add:
    ```ini
    [automount]
    enabled = false
    ```
    *Verification:* `cat /etc/wsl.conf` shows `enabled = false` under `[automount]`.
2. In PowerShell or Command Prompt, run `wsl --shutdown` and reopen WSL.
    *Verification:* `ls /mnt/c` shows no `C:` drive files.

### Re-enable access

1. In WSL, run `sudo nano /etc/wsl.conf` and set `enabled = true` or remove the `[automount]` lines.
    *Verification:* `cat /etc/wsl.conf` no longer sets `enabled = false`.
2. In PowerShell or Command Prompt, run `wsl --shutdown` and reopen WSL.
    *Verification:* `ls /mnt/c` lists `C:` drive folders like `Users` and `Windows`.

### Mount only C drive

Set `enabled = false` in `/etc/wsl.conf`, ensure `/mnt/c` exists (`sudo mkdir -p /mnt/c`), and add this to `/etc/fstab`:

```text
C:\ /mnt/c drvfs defaults,noatime,uid=1000,gid=1000 0 0
```

Run `wsl --shutdown` and reopen WSL, then check `df -h` to confirm `/mnt/c` is mounted without other Windows drives.

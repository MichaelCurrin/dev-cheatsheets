# Links

## Create a symbolic link

In PowerShell, you primarily use the `New-Item` cmdlet. While `mklink` works in Command Prompt, `New-Item` is the native PowerShell way.

Basic Syntax

```powershell
New-Item -ItemType SymbolicLink -Path "LinkPath" -Value "Target"
```

### File Symlink

```powershell
New-Item -ItemType SymbolicLink -Path "C:\MyLink.txt" -Value "C:\TargetFile.txt"
```

### Directory symlink

```powershell
New-Item -ItemType SymbolicLink -Path "C:\MyFolderLink" -Value "C:\TargetFolder"
```

### Management Commands

* **Check if a file is a link:**
```powershell
Get-Item "C:\PathToLink" | Select-Object Name, LinkType, Target

```

* **Remove a symlink:**
(This deletes the link only, not the target)

```powershell
Remove-Item "C:\MyLink"
```

### Required Permissions
*   **Administrator Privileges:** By default, creating symlinks requires an elevated PowerShell window (Run as Administrator).
*   **Developer Mode:** If Windows **Developer Mode** is enabled in Settings, standard users can create symlinks without elevation using the `-Name` parameter in `mklink` or standard `New-Item` calls in newer builds.


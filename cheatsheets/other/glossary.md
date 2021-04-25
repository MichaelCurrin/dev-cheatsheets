# Glossary

Definitions are similar but possibly confusing programming terms.


## Levels of software complexity 

From small and low-level to the high-level.

1. Character. A letter, stored as a byte.
2. Line.
3. Script. Code to run directly by a user through an entrypoint. It might be a standalone script or it might reply on importing modules. Such as run a Python script in shell or JavaScript file in browser.
4. Module. A unit of code for reuse. A script that can be imported by another script. A standalone script can also count a module, but usually a module is imported and can be reused by other scripts or modules.
5. Application. A script and possibly imported modules and libraries which can be run, such as through the shell or started a menu and run as a desktop application.
6. Package. An application or module that can be installed and includes some metadata like author, license and entrypoint. Usually the install step will unzip a package if needed and _copy_ the contents of the package to a location where it can be run widely. Such as installing a Python package from a git repo, a zip file or a URL, and then running that package as a standalone app in the shell or importing and using in other Python applications. A package is often made available publically in a packages repository (like for Debian and Ubuntu) or package registry (NPM or Pypi)
7. Library. Similar to a package. A library is intended to be imported as a module inside an application. It contains a collection or "library" of functions or classes to use. A library might do nothing of you run it directly.


## Title

Term | Description 
---  | ---
Coder | This most literally writing code. Coder doesn't appear as a title of job. It is also a broad term, including people who like to code but aren't IT professionals.
Programmer or computer programmer | A broad term.
Developer | A broad term.
Web developer | This kind of person likely knows HTML, CSS and JS. They might just do the frontend. Or they might also do backend like APIs and databases, which are integral for many websites even though users don't seem these parts directly.
Software engineer | In some cases, developer and engineer are used interchangeably. But "engineer" does have a different meaning. While a programmer or developer executes a design to build something, an engineer designs a solution and considers the architecture and then builds the solution.


## Industry 

I'd say these are same. They are used to describe the industry, career and a subject on school or university.

- Information Systems.
- Information Technology or IT.


## Interfaces 

Term | Description 
---  | ---
Command-line | An interactive way on a machine to run commands in the shell. e.g. Create a file or run a Python script using the command-line.
Command-line Interface or CLI | This can mean the mean the same as "command-line", where the generic interface is application where you run command-line commands inside of. e.g. Run a shell command in the CLI. Or this can be an application-specfic way to run command-line commands e.g. Python has a CLI so you can run `python` with various arguments in the command-line and you can use that to check your Python version (`python -V`), run a script (`python app.py`) and many other tasks.
Console | A way to run commands and view output. While Command-line mostly is for shell commands, a Console is more generic. e.g. If you run `python` or `node` without a script name, you'll start the _interactive console_ where you can run Python or JavaScript statements and see the result printed. The browser also has a developer console where you can run JavaScript commands and see logs of scripts that ran and succeeded or failed.
Terminal | Same as command-line. e.g. Open your terminal and run the shell command there.
Terminal emulator | Originally a terminal was a dumb keyboard and screen that did no processing alone but allowed you to interface with a larger machine, which had many terminals for people to use. On modern day machines, you will use a terminal emulator (or terminal applications) which feels like the old terminal and lets you run shell commands. You'll download and use a terminal emulator like Konsole, iTerm2, or Yakuake.
Command-prompt | A way to interact with an application or the shell. e.g. Open the command-prompt application on Windows to run shell commands. Or use the command-prompt on your IDE to type or select commands to run like to format a file.

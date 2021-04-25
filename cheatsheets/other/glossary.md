# Glossary

Explainations of computing terms which might be confusing to tell apart.

These are based on my experience reading widely and looking up definitions myself. Some people may use these terms in a different way or treat two terms as the same thing. I have mentioned this as far as possible here.


## Levels of software complexity 

From small and low-level to the high-level.

1. Character. A letter, stored as a byte.
2. Line of code.
3. Script. 
    - Code to run directly by a user through an entrypoint. It might be a standalone script or it might reply on importing modules. Such as run a Python script in shell or JavaScript file in browser.
4. Module. 
    - A unit of code for reuse. A script that can be imported by another script. A standalone script can also count a module, but usually a module is imported and can be reused by other scripts or modules.
5. Application or library (as a choice on how the code can be run) and package (if the code can be installed).
   - Application. 
       - A script that might import modules and external libraries. It can be **run** directly, such as through the shell, or started via a menu and run as a desktop or mobile application. 
       - [Rapid API post][].
           > An application (app) is a program or a collection of programs that have been designed for the end-users.
           >
           > They help you to perform a set of coordinated tasks, functions, or activities. 
   - Library. 
       - A library is intended to be imported as a module and used inside another application or library. It contains a collection or "library" of functions or classes to use. A library might do nothing of you run it directly. Unless it is set up to also run as an application.
   - Package. 
       - A project that can be bundled or "packaged" as a single unit containing other files, then installed when needed. The bundle package can be moved around on a machine and is often published (uploaded to a public location) so other can download and install it. A package could be for running code as an, application, as a a library, letting you do both. A patckagenusually includes some metadata like author, license, version number and entrypoint (which script to execute when starting running the package). Usually a package manager will have an install step that will unzip a package if needed and _copy_ the contents of the package to a location where it can be run widely. Such as installing a Python package from a git repo, a zip file or a URL, and then running that package as a standalone app in the shell or importing and using in other Python applications. A package is often made available publically in a packages repository (like for Debian and Ubuntu) or package registry (NPM or Pypi)
   
Note that a package makes an application or library able to be installed. You might get a package using the command-line like `pip install` or `npm install` or `apt install`. Or you might download an installer from a website. Or you might install a package at a higher level, like browsing apps in a desktop or mobile app store or using a disc.

All libraries are also packages - otherwise you can't install and use them.

Other terms not covered above:

- Program. 
    - A set of instructions that can be executed on a computer or machine. Using the structure above, a script and all the levels which build on scripts are all programs.
    - From [Rapid API post][].
        > Programs are a collection or sequence of executable instructions that aid in the automatic performance of targeted tasks on a computer.
        >
        > It refers to a set of coded instructions that a computer can recognize to solve a problem or yield the desired result.
- Code. 
    - In one respect, code is same as a program or script. 
    - But code can also include a configuration files, HTML files or CSS files. You cannot "run" those as a sequence like you can a script, but they are still instructions for a machine to follow and are used to build applications.
- Web app.
    - A website is usually not considered an application. In runs inside your browser, which an application.
    - With the rise of JS, websites have become more complex and interactive. A website built on Python or JavaScript is usually 

[Rapid API post]: https://rapidapi.com/blog/application-vs-program/


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


## Code interfaces 

Term | Description 
---  | ---
Command-line | An interactive way on a machine to run commands in the shell. e.g. Create a file or run a Python script using the command-line.
Command-line Interface or CLI | This can mean the mean the same as "command-line", where the generic interface is application where you run command-line commands inside of. e.g. Run a shell command in the CLI. Or this can be an application-specfic way to run command-line commands e.g. Python has a CLI so you can run `python` with various arguments in the command-line and you can use that to check your Python version (`python -V`), run a script (`python app.py`) and many other tasks.
Console | A way to run commands and view output. While Command-line mostly is for shell commands, a Console is more generic. e.g. If you run `python` or `node` without a script name, you'll start the _interactive console_ where you can run Python or JavaScript statements and see the result printed. The browser also has a developer console where you can run JavaScript commands and see logs of scripts that ran and succeeded or failed.
Terminal | Same as command-line. e.g. Open your terminal and run the shell command there.
Terminal emulator | Originally a terminal was a dumb keyboard and screen that did no processing alone but allowed you to interface with a larger machine, which had many terminals for people to use. On modern day machines, you will use a terminal emulator (or terminal applications) which feels like the old terminal and lets you run shell commands. You'll download and use a terminal emulator like Konsole, iTerm2, or Yakuake.
Command-prompt | A way to interact with an application or the shell. e.g. Open the command-prompt application on Windows to run shell commands. Or use the command-prompt on your IDE to type or select commands to run like to format a file.
REPL | Read Evaluate Print Loop. An interactive program that takes a command (read), processes it (evaluate), displays output (print) and then waits to read more input (loop). Unlike a program that runs or stops but without asking for more input, a REPL is a text-based interactive way to repeatedly send ad hoc instructions. A Bash shell and Python interactive console are good examples of a REPL. But you can also build your own REPL within say your Python program. Rather than expecting code as input, you expect text. Like asking a user for their name on one line, asking for their age on the next and doing something with those. Typically a REPL has a help command to see available commands you can give, including an exit command to break out the loop with `exit`, `quit` or `q`.

## Visual interfaces

Term | Description 
---  | ---
UI | User Interface. General way to describe what the user sees and **interacts** with in an application. Such as using a shell CLI, a REPL, a desktop application or a browser. Usually, one talks about the UI as the theme, layout and components (buttons, images) of a webpage or mobile app view.
GUI | Graphical User Interface. Often the acronym is said as "gooey". A GUI is a general term for interacting with an application using a **visual** interface rather than a text interface. For example, viewing buttons, images and colors in a window and you can click on items with mouse. A text interface is usually linear (top to bottom) while a GUI lets you follow different paths. The font and color are mostly fixed in a text UI, while a visual UI uses these and other elements to make a more user-friendly application.
UX | User Experience. While the UI is more literally what the user sees, the user experience is **how** the application feels and changes as the user **moves** or transitions between say pages, or steps on a form. One might describe an application's UX as clunky and hard to use or understand, or as smooth, natural and intuitive. If clicking a button does something unexpected or takes unreasonably long to load, that is bad user experience. What the button or loading bar looks like as images or animations is more related to the UI.

A GUI is great for inexperienced users or non-coders to use. However, it takes more work to make and is more complex to design.

# Desgin CLI


## Positional arguments vs flags

### Positional

For the **"What"** (The primary object/target).

* **It is the "Noun":** The argument represents the primary object being acted upon (e.g. a filename, a URL, or a directory).
* **Simplicity is King:** You only have one or two required inputs that are extremely intuitive.
* **Standard Conventions Apply:** You are building a utility similar to classic tools like `rm`, `mkdir`, or `cd` where users expect to just type the target and hit enter.
* **Order is Obvious:** The relationship is a clear "Source to Destination" (e.g., `cp <src> <dest>`).


## Flags

For the **"How"** (Configuration and details).

* **Order is Confusing:** You have three or more arguments; flags remove the "what goes first?" mental tax for the user.
* **Clarity is Needed:** The values are ambiguous (e.g., distinguishing between `--start-date` and `--end-date`).
* **Readability Matters:** You want the command to be "self-documenting" so someone glancing at a script knows exactly what each value represents.
* **Future-Proofing:** You anticipate adding more optional parameters later without breaking the existing command structure.

### Passwords

Use if the input is sensitive. It is a secret, such as an API key or password, to keep it clearly labeled and manageable.

You can also keep it out of the history.

Note that while `-pPASSWORD` is common in legacy tools (like MySQL), it is generally discouraged because the password will show up in plain text in the system's process list (`ps aux`) and shell history. Encourage your users to use the blank `-p` prompt whenever possible (and then prompt the user for the password interactively).

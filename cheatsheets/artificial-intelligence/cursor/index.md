# Cursor

- [cursor.com](https://www.cursor.com/)

![image](https://github.com/user-attachments/assets/3caf4bbf-c6a9-4dc9-b2f5-7c701cb19f5a)

An AI-focused IDE for creating and updating code, tab auto-completion, and for chats with persistent history.

Read more on the [Features](https://www.cursor.com/features) page of the Cursor website.


## Launch

Open a project from the command-line:

```sh
$ # e.g.
$ cursor .
$ # e.g.
$ cursor my-repo
```

## Features

The main actions you can do.

### Code

On macOS, COMMAND+K.

Here is an example of using code editing to apply changes inline:

![image](https://github.com/user-attachments/assets/1e334337-da8d-485c-99b2-9bee7fc71570)

### Tab auto-completion

Press <kbd>tab</kbd> in your code. Get a result for one or multiple lines.

This is called Cursor Tab or Cursor++.

![image](https://github.com/user-attachments/assets/39e0c3a7-f8ca-4cd8-9914-16d2cb6f844b)

### Chat

On macOS, COMMAND+L.

Applying code changes directly can be limiting without a conversation first and without getting an explanation out. So use the chat pane to ask to have a conversation and then ask for changes, then apply them. 

![image](https://github.com/user-attachments/assets/e0ce9311-16b4-473e-bea8-3aab6c0c8fd4) 

![image](https://github.com/user-attachments/assets/5fac2d4f-7d6f-4fec-a232-6bb4b90cbed6)

### Terminal

Ask questions in the terminal. On macOS, COMMAND+K.


For Bash:

![image](https://github.com/user-attachments/assets/f2471155-592d-4b66-9362-f80075de9438)

![image](https://github.com/user-attachments/assets/4f93f5a0-675e-47c9-9a6d-b9bfdbf0a8ee)

For Python:

![image](https://github.com/user-attachments/assets/66064f00-ba28-4577-8488-074c85ac1c5e)

![image](https://github.com/user-attachments/assets/8ae8d3f8-44c4-440c-969f-9b949fbbd7d5)


For SQLite:

![image](https://github.com/user-attachments/assets/4df4f422-6de4-4fdb-8adf-97e8dfff5040)

![image](https://github.com/user-attachments/assets/99d7c714-2323-4a04-87ff-0a8f93263e57)


## Usage tips

How to get the most out of the features above

### Add to chat

Select code and press COMMAND+L or COMMAND+SHIFT+L to add multiple pieces of code to the chat context. If you select code and paste with COMMAND+V then that works too. Or click "Add to chat", which is the message instead of "Chat" if there is already code.

![image](https://github.com/user-attachments/assets/9fbd7469-6c70-40c8-945b-937b213b04e9)

![image](https://github.com/user-attachments/assets/f103e254-9507-4884-b1ee-2a8e0a96bbdd)

### @ mentions

Use the "@" symbol either in the code writing/editing or in the chat, so you can reference with objects like specific files or classes. 

![image](https://github.com/user-attachments/assets/a0c7d336-6248-4d5e-8d5a-72bf2e46ed71)
![image](https://github.com/user-attachments/assets/b8d275ab-f666-4779-bbac-4f90471f5da1)

Choose existing 3rd-party documentation:

![image](https://github.com/user-attachments/assets/bc3b278f-7b00-4984-a489-e834c1e0234c)


### Codebase reference

In that chat, use the option to reference the whole base rather than the current file (this will be more expensive but can give you a better solution by understanding multiple files and the suggestions can be across files).

![image](https://github.com/user-attachments/assets/d1d2b340-d77d-444d-b0ca-78f4705b70ef)

This can be done with by clicking the _with codebase_ button or pressing _COMMAND + ENTER_.

### Scope of changes

When getting code changes, apply for the whole while or just specific lines. 

![image](https://github.com/user-attachments/assets/21d3b346-a726-4fba-b5bb-a469afa31185)

### Comments

You can write code comments for your requirements before you have code or a function name without a body, then use the tab auto-completion to complete your code.

Even if you don't use AI to fill out the comments, you can fill it in yourself manually or come back to it another day or share with someone else. 


### Documentation

If Cursor does not understand a library or tool that is out of the training data, then you can give it a URL for a documentation page.

![image](https://github.com/user-attachments/assets/c2b4e265-98d6-4e10-9e47-a610572618cb)

![image](https://github.com/user-attachments/assets/f2531ff8-d3e0-412c-96ba-47a84b7c5706)

![image](https://github.com/user-attachments/assets/54f511ac-7feb-4788-a2fe-bb4638d0be2e)

![image](https://github.com/user-attachments/assets/e83b85a5-56ff-45d7-ab6b-43e5a2cccf1e)

Or go through "@" mentions and pick _Add new doc_.

![image](https://github.com/user-attachments/assets/bc3b278f-7b00-4984-a489-e834c1e0234c)

Manage docs under Cursor's settings:

![image](https://github.com/user-attachments/assets/4c8cb1fa-79d6-4f0b-b81e-6ded39853775)

### System prompt

Go to Cursor settings and set the system prompt so you get code that is consistent with what you expect.

See [LLM](https://michaelcurrin.github.io/code-cookbook/recipes/artificial-intelligence/llm.html) page for some samples.

### Upload images

You cannot upload an image to the prompt like with other genAIs but you can reference a file in your project with GPT-4.

![image](https://github.com/user-attachments/assets/0e04a71c-cad0-4a0e-ba06-6433dd5fd16b)

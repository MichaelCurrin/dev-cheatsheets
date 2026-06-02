# Edit an earlier commit

If you want to edit a commit in the history without doing a reset and having to redo the commits after. The approach here is to do an interactive rebase.

1. **Start interactive rebase**
    ```bash
    git rebase -i HEAD~3
    ```
2. **Select commit to edit**. In the text editor, change `pick` to `edit` for the target commit, then save and close.
3. **Apply changes**. Modify your files as needed and stage them.
    ```bash
    git add <file-name>
    ```
4. **Amend the commit**
    ```bash
    git commit --amend --no-edit
    ```
5. **Complete rebase**
    ```bash
    git rebase --continue
    ```

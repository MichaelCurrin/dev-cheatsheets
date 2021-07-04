# Clickable

If you want to make any element appear that it is clickable like a button or anchor tag.

Set the cursor on that object to `pointer`. Note that you do **not** need the `:hover` modifier for this work.

Here the hover behavior is set to change the text color on hover.

- HTML:
    ```html
    <p class="my-class ">My text</p>
    ```
- CSS:
    ```css
    .my-class {
      cursor: pointer;
      color: blue;
    }
    
    .my-class:hover {
      color: purple;
    }
    ```
    

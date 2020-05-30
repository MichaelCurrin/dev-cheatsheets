# Forms

Input elements for forms. 

Note that these do not render on Github, but could be viewed as a static site or an IDE's Markdown preview.

Examples mostly from [W3Schools](https://www.w3schools.com).


## Form

```html
<form action="/action_page.php" method="get">
    <div id="radio-toolbar">
    </div>
    <!-- etc. -->
</form>
```


## Input

```html
<label for="fname">First name:</label>
<input type="text" id="fname" name="fname" size="50"><br><br>
<label for="pin">PIN:</label>
<input type="text" id="pin" name="pin" maxlength="4" size="4"><br><br>
<input type="submit" value="Submit">
```

<label for="fname">First name:</label>
<input type="text" id="fname" name="fname" size="50"><br><br>
<label for="pin">PIN:</label>
<input type="text" id="pin" name="pin" maxlength="4" size="4"><br><br>
<input type="submit" value="Submit">


- Size attribute - Specifies the width of an `<input>` element, in characters. Default value is 20.

See also:

- [Searchbar](https://www.w3schools.com/howto/howto_css_searchbar.asp) tutorial.


## Text area

<label for="my-text">Label</label>
<textarea id="my-text" rows="4" cols="50">Text area input</textarea>

<textarea maxlength="50">
Text area with max length
</textarea>


## Bulma note

If using [Bulma](https://bulma.io) for styling, you will find the inputs fill the width of their container.

```
input {
    width: 100%;
    max-width: 100%;
}
```

This can be overridden. In the example below, the `search` class is targeted.

```css
.search.input {
    width: inherit;
}
```


## Text input

```html
<label for="fname">First name:</label>
<input type="text" id="fname" name="fname" size="50"><br><br>

<label for="pin">PIN:</label>
<input type="text" id="pin" name="pin" maxlength="4" size="4"><br><br>

<input type="submit" value="Submit">
```

- Size attribute - Specifies the width of an `<input>` element, in characters. Default value is 20.
- Max length attribute - How many characters that can be entered. This could exceed `size` - all the text just won't be visible at once.

See also:

- [Searchbar](https://www.w3schools.com/howto/howto_css_searchbar.asp) tutorial.

## Text area

```html
<label for="my-text">Label</label>
<textarea id="my-text" rows="4" cols="50">Textarea input</textarea>

<textarea maxlength="50">
Text area with max length
</textarea>
```

- [Text area](https://www.w3schools.com/tags/tag_textarea.asp) tutorial.


## Radio buttons

- [Tutorial](https://www.w3schools.com/tags/att_input_type_radio.asp)

Note how `for` must match `id`. The `name` is optional.

```html
<input type="radio" id="radioApple" name="radioApple" value="apple" checked>
<label for="radioApple">Apple</label>

<input type="radio" id="radioBanana" name="radioFruit" value="banana">
<label for="radioBanana">Banana</label>

<input type="radio" id="radioOrange" name="radioFruit" value="orange">
<label for="radioOrange">Orange</label>
```


## Checkbox input

- [Tutorial](https://www.w3schools.com/tags/att_input_type_checkbox.asp)
- [Todo list](https://www.w3schools.com/howto/howto_js_todolist.asp)

```html
<input type="checkbox" name="vehicle1" value="Bike">
<label for="vehicle1"> I have a bike</label><br>

<input type="checkbox" name="vehicle2" value="Car">
<label for="vehicle2"> I have a car</label><br>

<input type="checkbox" name="vehicle3" value="Boat" checked>
<label for="vehicle3"> I have a boat</label><br><br>
<input type="submit" value="Submit">
```

<input type="checkbox" name="vehicle1" value="Bike">
<label for="vehicle1"> I have a bike</label><br>

<input type="checkbox" name="vehicle2" value="Car">
<label for="vehicle2"> I have a car</label><br>

<input type="checkbox" name="vehicle3" value="Boat" checked>
<label for="vehicle3"> I have a boat</label><br><br>
<input type="submit" value="Submit">
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTM0MjIzMTkyM119
-->
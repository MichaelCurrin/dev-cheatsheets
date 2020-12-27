# Forms
> Guide to input elements for forms

Note that these do not render on GitHub's markdown, but can be viewed on a static site or an IDE's Markdown preview.

Examples are mostly from [W3Schools](https://www.w3schools.com).


## Form element

```html
<form action="/action_page.php" method="get">
    <div id="radio-toolbar">
    </div>

    <!-- etc. -->
</form>
```


## Labels

See [label](https://www.w3schools.com/tags/tag_label.asp) tag.

It is recommended to add a `label` element next to an input.

This helps for accessibility so the correct label is read aloud on focussing and it increases the hit rate when clicking small regions - so you can click the label for a radio input to select an item.

From W3 Schools:

> Tip: Always use the `<label>` tag to define labels for `<input type="text">`, `<input type="checkbox">`, `<input type="radio">`, `<input type="file">`, and `<input type="password">`.

The label element must have a `for` attribute which references the `id` of an input element.


## Text input

See [Input tag](https://www.w3schools.com/tags/tag_input.asp) tutorial on W3 Schools. It covers all the available `type` values.

```html
<label for="fname">First name:</label>
<input type="text" id="fname" name="fname" size="50"><br>

<label for="pin">PIN:</label>
<input type="text" id="pin" name="pin" maxlength="4" size="4"><br>

<input type="submit" value="Submit">
```

<label for="fname">First name:</label>
<input type="text" id="fname" name="fname" size="50"><br>

<label for="pin">PIN:</label>
<input type="text" id="pin" name="pin" maxlength="4" size="4"><br>

<input type="submit" value="Submit">


- Size attribute 
    - Specifies the width of an `<input>` element, in characters. Default value is 20.
- Max length attribute 
    - How many characters that can be entered. This could exceed `size` - all the text just won't be visible at once.
- Name attribute 
    - The `name` is optionally but usually set on the input matching the `id`. The name is used to to reference elements in a JavaScript, or to reference form data after a form is submitted. Note: Only form elements with a name attribute will have their values passed when submitting a form.

See also:

- [Searchbar](https://www.w3schools.com/howto/howto_css_searchbar.asp) tutorial.
- [required](https://www.w3schools.com/tags/att_input_required.asp) attribute in `input` tag.

### Bulma note

If using [Bulma](https://bulma.io) for styling, you will find the inputs fill the width of their container.

```css
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

## Text area

```html
<label for="my-text">Label</label>
<textarea id="my-text" rows="4" cols="50">Text area input</textarea>

<textarea maxlength="50">
    Text area with max length
</textarea>
```

- [Text area](https://www.w3schools.com/tags/tag_textarea.asp) tutorial.


## Radio buttons

- [Radio input tutorial](https://www.w3schools.com/tags/att_input_type_radio.asp)

```html
Package type:

<input type="radio" id="py" name="py" value="python" checked>
<label for="py">Python</label>

<input type="radio" id="npm" name="npm" value="npm">
<label for="npm">NPM</label>

<input type="radio" id="ruby" name="ruby" value="ruby">
<label for="ruby">Ruby</label>
```


## Checkbox input

- [Tutorial](https://www.w3schools.com/tags/att_input_type_checkbox.asp)
- [Todo list](https://www.w3schools.com/howto/howto_js_todolist.asp)

```html
<input type="checkbox" name="vehicle1" value="Bike">
<label for="vehicle1">I have a bike</label><br>

<input type="checkbox" name="vehicle2" value="Car">
<label for="vehicle2">I have a car</label><br>

<input type="checkbox" name="vehicle3" value="Boat" checked>
<label for="vehicle3">I have a boat</label><br><br>

<input type="submit" value="Submit">
```

<input type="checkbox" name="vehicle1" value="Bike">
<label for="vehicle1">I have a bike</label><br>

<input type="checkbox" name="vehicle2" value="Car">
<label for="vehicle2">I have a car</label><br>

<input type="checkbox" name="vehicle3" value="Boat" checked>
<label for="vehicle3">I have a boat</label><br><br>

<input type="submit" value="Submit">


## Form sections

Based on [guide](https://html.com/forms/).

```html
<form>
    <fieldset name='my-set'>
        <legend>Name of section</legend>

        <input type="checkbox" name='foo'>
    </fieldset>

    <!-- repeat -->
</form>
```

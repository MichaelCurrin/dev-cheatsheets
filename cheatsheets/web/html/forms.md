# Forms
> Guide to input elements for forms

Note that these do not render on GitHub's markdown, but can be viewed on a static site or an IDE's Markdown preview.

Examples are mostly from [W3Schools](https://www.w3schools.com).

See [W3 CSS Input](https://www.w3schools.com/w3css/w3css_input.asp) tutorial for styling a form.


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


## Name attribute

The `name` is optionally set on an input and must match the `id`.

According to W3 Schools [name attribute](https://www.w3schools.com/tags/att_input_name.asp) page:

- The `name` is used to
    - Reference elements in a JavaScript, or
    - Rreference form data after a form is submitted. 
- Form elements with a `name` attribute will have their values passed when submitting a form.

In the case of a text input, each `name` value is unique.

But in the case of [Radio buttons](#radios-buttons), the value must be repeated in order to **group** elements.


## Text input

See [Input tag](https://www.w3schools.com/tags/tag_input.asp) tutorial on W3 Schools. It covers all the available `type` values.

The default value is `type="text"`, so you can actually omit that.

{% capture text_input %}
<label for="fname">First name:</label>
<input type="text" id="fname" name="fname" size="50"><br>

<label for="pin">PIN:</label>
<input type="text" id="pin" name="pin" maxlength="4" size="4"><br>

<input type="submit" value="Submit">
{% endcapture %}

**Code**

```html
{{ text_input }}
```

**Result**

{{ text_input }}

### Notes

- Size attribute 
    - Specifies the width of an `<input>` element, in characters. Default value is 20.
- Max length attribute 
    - How many characters that can be entered. This could exceed `size` - all the text just won't be visible at once.

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

{% capture radio_buttons %}
Package type:

<input type="radio" id="py" name="package-type" value="python" checked>
<label for="py">Python</label>

<input type="radio" id="npm" name="package-type" value="npm">
<label for="npm">NPM</label>

<input type="radio" id="ruby" name="package-type" value="ruby">
<label for="ruby">Ruby</label>
{% endcapture %}

**Code**

```html
{{ radio_buttons }}
```

**Result**

{{ radio_buttons }}

### Notes

> Radio buttons are normally presented in radio groups (a collection of radio buttons describing a set of related options).
>
> Only **one** radio button in a group can be selected at the same time.
>
> Note: The radio group must have share the **same** `name` (the value of the `name` attribute) to be treated as a group. Once the radio group is created, selecting any radio button in that group automatically deselects any other selected radio button in the same group. You can have as many radio groups on a page as you want, as long as each group has its own name.
>
> Note: The `value` attribute defines the unique value associated with each radio button. The value is not shown to the user, but is the value that is sent to the server on "submit" to identify which radio button that was selected.
>
> Tip: Always add the `<label>` tag for best accessibility practices!


## Droplists

See [select](https://www.w3schools.com/tags/tag_select.asp) tag.

See also [Dropdown](https://www.w3schools.com/w3css/w3css_dropdowns.asp) menus.

{% capture radio_buttons %}
<label for="cars">Choose a car:</label>

<select name="cars" id="cars">
    <option value="volvo">Volvo</option>
    <option value="saab">Saab</option>
    <option value="mercedes">Mercedes</option>
    <option value="audi">Audi</option>
</select> 
{% endcapture %}

Use `for` and `id` to associate the label with the input. Use `name` to ensure the values get submitted.

**Code**

```html
{{ radio_buttons }}
```

**Result**

{{ radio_buttons }}


## Checkboxes

- [Tutorial](https://www.w3schools.com/tags/att_input_type_checkbox.asp)
- [Todo list](https://www.w3schools.com/howto/howto_js_todolist.asp)

As with radio buttons, use `for` and `id` for combining inputs and `name` for submitting.

{% capture checkboxes %}
<input type="checkbox" id="vehicle1" name="vehicle1" value="Bike">
<label for="vehicle1">I have a bike</label><br>

<input type="checkbox" id="vehicle2" name="vehicle2" value="Car">
<label for="vehicle2">I have a car</label><br>

<input type="checkbox" id="vehicle2" name="vehicle3" value="Boat" checked>
<label for="vehicle3">I have a boat</label><br><br>

<input type="submit" value="Submit">
{% endcapture %}

**Code**

```html
{{ checkboxes }}
```

**Result**

{{ checkboxes }}


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

# Forms

Input elements for forms.


## Form

```html
<form action="/action_page.php" method="get">
    <!-- Inputs go here -->
</form>
```


## Radio buttons

- [Tutorial](https://www.w3schools.com/tags/att_input_type_radio.asp)

```html
<div class="radio-toolbar">
    <input type="radio" id="radioApple" name="name" value="apple" checked>
    <label for="radioApple">Apple</label>

    <input type="radio" id="radioBanana" name="radioFruit" value="banana">
    <label for="radioBanana">Banana</label>

    <input type="radio" id="radioOrange" name="radioFruit" value="orange">
    <label for="radioOrange">Orange</label>
</div>
```


## Checkbox

- [Tutorial](https://www.w3schools.com/tags/att_input_type_checkbox.asp)
- [Todo list](https://www.w3schools.com/howto/howto_js_todolist.asp)

```html
<div>
    <input type="checkbox" name="vehicle1" value="Bike">
    <label for="vehicle1"> I have a bike</label><br>
    
    <input type="checkbox" name="vehicle2" value="Car">
    <label for="vehicle2"> I have a car</label><br>
    
    <input type="checkbox" name="vehicle3" value="Boat" checked>
    <label for="vehicle3"> I have a boat</label><br><br>
    <input type="submit" value="Submit">
</div>
```

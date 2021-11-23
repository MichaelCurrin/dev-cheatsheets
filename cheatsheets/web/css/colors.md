# Colors


## CSS variables

In modern CSS, you can define variables without any pre-processing. See [CSS Variables](https://www.w3schools.com/css/css3_variables.asp) tutorials.

Advantages are that the code is easier to read and to change.

### Syntax

```
var(name, value)
```

- `name` - Required. The variable name (must start with two dashes).
- `value` - Optional. The fallback value.

Create a variable with a local scope.

Or with a global scope, using `:root`.

### Example

```css
:root {
  --blue: #6495ed;
  --white: #faf0e6;
}

body { 
  background-color: var(--blue); 
}
```

From Vue.js:

```css
:root {
  --green: #42b983;
  --green-dark: #3aa776;
  --grey: #2c3e50;
}
```

Overriding a local variable.

```css
:root {
  --blue: #1e90ff;
  --white: #ffffff;
}

button {
  --blue: #0000ff;
  color: var(--blue);

  background-color: var(--white);
}
```


## CSS filter
> Use the `filter` function to change a color

See [CSS filter Property](https://www.w3schools.com/cssref/css3_pr_filter.asp) tutorial on W3 Schools.

### Syntax

```
filter: 
    none | blur() | brightness() | contrast() | drop-shadow() | grayscale() | hue-rotate() 
        | invert() | opacity() | saturate() | sepia() | url(); 
```
 
To change the brightness, use a percentage value from `0%` to `100%` for a darker value, or over `100%` for lighter results. You don't need to know the initial color value, so this is flexible.

### Examples

Make text lighter or faded.

```css
.faded {
  filter: brightness(200%);
}
```

Make text darker.

```css
.darker {
  filter: brightness(50%);
}
```

Make an image grayscale.

```css
img {
  filter: grayscale(100%);
}
```


## SCSS variables

Define a color and make variations.

```scss
$grey-color: #828282 !default;
$grey-color-light: lighten($grey-color, 40%) !default;
$grey-color-dark: darken($grey-color, 25%) !default;
```

Fuller example using variables as colors. This is for a Jekyll project which uses SCSS/SASS.

- `_sass/minima.scss` - setting some default values. This file comes from the theme.
    ```scss
    $text-color: #111 !default;
    $background-color: #fdfdfd !default;
    $brand-color: #2a7ae2 !default;
    
    $grey-color: #828282 !default;
    $grey-color-light: lighten($grey-color, 40%) !default;
    $grey-color-dark: darken($grey-color, 25%) !default;
    ```
- `assets/css/minima.scss` - set a value, import the file above, then add some more colors. This is a project-specific file.
    ```scss
    $brand-color: #0ab;
    
    /* Theme styling */
    
    @import "minima";

    /* Custom styling */

    $brand-blue: $brand-color;
    $brand-red: #e8262d;
    $brand-yellow: #eda329;
    
    h2 {
      color: white;
      background: $brand-blue;
    }
    ```

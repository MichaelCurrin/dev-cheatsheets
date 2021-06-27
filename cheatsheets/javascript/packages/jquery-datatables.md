# jQuery DataTables

See [Dev Resources](https://michaelcurrin.github.io/dev-resources/resources/javascript/packages/jquery-datatables/) page.


{% raw %}

## Initialize

In your HTML:

```html
<script>
    $(document).ready(function () {
        $("#my-table").DataTable({
            // Config options.
            orderCellsTop: true,

            // Enable plugins.
            fixedHeader: true,

            initComplete: function () {
                foo(this)
            }
        });
    });

</script>
```

In `initComplete` function, you can put calls which add to the table, such as adding a search bar.

Alternatively, you can do it like this:

```javascript
const table = $("#my-table").DataTable()
foo(table)
```

Note that depending on the approach, you use a different reference to the table.

With `table` declared, you can do `table.column(0)` for example.

And in `initComplete`, you can pass `this` which gives you the same access in the other function.

But to pass a column instead, I found I had to do `this.api()` otherwise I would get an error that a method does not exist.

e.g.

```javascript
const bazzCol = this.api().column(0)
bar(bazzCol)
```


## Column types

This is supposed to be automatic, but that might not be true for dirty data.

```javascript
$("#my-table").DataTable({
  columnDefs: [
        { "type": "num-fmt", "targets": 3 },
        { "type": "date", "targets": 5 },
    ]
});
```


## Column lookup

See [Column selector](https://datatables.net/reference/type/column-selector) in the docs.

### All data

```javascript
var table = $('#example').DataTable();
var allData = table.columns().data();
```

### Get column by index

Using a zero-based index.

```javascript
var table = $('#example').DataTable();
var data = table.column(0).data();
```

### Get column my name

```javascript
var table = $('#example').DataTable( {
    columns: [
        { name: 'first-name' },
        { name: 'last-name' },
        { name: 'position' },
        { name: 'location' },
        { name: 'salary' }
    ]
} );

table.column( 'salary:name' ).data();
```

### Unique values in a column

```javascript
var values = column.data().unique().sort()

value.each( function (d, j) {
    select.append(`<option value="${d}">${d}</option>`)
});
```

### Column search

See [column().search() API](https://datatables.net/reference/api/column().search()).


## Escape string

Use this function to escape a regex pattern.

`escapeRegex`

Example from the [docs](https://datatables.net/reference/api/%24.fn.dataTable.util.escapeRegex()).

```javascript
var val = $.fn.dataTable.util.escapeRegex(
    $(this).val()
);

column
    .search( val ? `^${val}$` : "", true, false )
    .draw();
```

## Plugin structure

Search functions to be attached here:

```javascript
$.fn.dataTable.ext.search
```

Use 5 inputs:

```
settings, searchData, index, rowData, counter )
```

e.g. From the [Search](https://datatables.net/manual/plug-ins/search) docs.

```javascript
$.fn.dataTable.ext.search.push(
    function( settings, searchData, index, rowData, counter ) {
        var min = parseInt( $('#min').val(), 10 );
        var max = parseInt( $('#max').val(), 10 );
        var age = parseFloat( searchData[3] ) || 0; // using the data from the 4th column

        if ( ( isNaN( min ) && isNaN( max ) ) ||
             ( isNaN( min ) && age <= max ) ||
             ( min <= age   && isNaN( max ) ) ||
             ( min <= age   && age <= max ) )
        {
            return true;
        }
        return false;
    }
);
```

{% endraw %}

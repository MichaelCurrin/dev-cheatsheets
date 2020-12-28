# jQuery DataTables

{% raw %}

## Initialize

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

{% endraw %}

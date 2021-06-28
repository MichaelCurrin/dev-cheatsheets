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


## Load data

### Ajax JSON file

See [ajax.json()](https://datatables.net/reference/api/ajax.json())

JS:

```javascript
const table = $('#example').DataTable( {
  ajax: "data.json"
} );
 
table.on( 'xhr', function () {
  const json = table.ajax.json();
  alert( json.data.length +' row(s) were loaded' );
} );
```

See also [Ajax Sourced Data](https://datatables.net/examples/data_sources/ajax.html) and [POST data](https://datatables.net/examples/server_side/post.html) under examples in the docs.

- Script tag.
    ```html
    <script>
    $(document).ready(function() {
      $('#example').DataTable( {
        ajax: 'data.json'
      });
    });
    </script>
    ```
    
If doing a `POST` to an API, you can do this instead.

```javascript
$('#example').DataTable( {
  ajax: {
    url: "api/data.json",
    type: "POST"
  },
});
```
        
Set up the table outline with no data.

```html
<table id="example" class="display" style="width:100%">
    <thead>
        <tr>
            <th>Name</th>
            <th>Position</th>
            <th>Office</th>
            <th>Extn.</th>
            <th>Start date</th>
            <th>Salary</th>
        </tr>
    </thead>
    <tfoot>
        <tr>
            <th>Name</th>
            <th>Position</th>
            <th>Office</th>
            <th>Extn.</th>
            <th>Start date</th>
            <th>Salary</th>
        </tr>
    </tfoot>
</table>
```

Data in a JSON file:

- `data.json`
    ```json
    {
      "data": [
        [
          "Tiger Nixon",
          "System Architect",
          "Edinburgh",
          "5421",
          "2011/04/25",
          "$320,800"
        ],
        [
          "Garrett Winters",
          "Accountant",
          "Tokyo",
          "8422",
          "2011/07/25",
          "$170,750"
        ],
        [
          "Ashton Cox",
          "Junior Technical Author",
          "San Francisco",
          "1562",
          "2009/01/12",
          "$86,000"
        ],
        [
          "Cedric Kelly",
          "Senior Javascript Developer",
          "Edinburgh",
          "6224",
          "2012/03/29",
          "$433,060"
        ],
        [
          "Airi Satou",
          "Accountant",
          "Tokyo",
          "5407",
          "2008/11/28",
          "$162,700"
        ],
        [
          "Brielle Williamson",
          "Integration Specialist",
          "New York",
          "4804",
          "2012/12/02",
          "$372,000"
        ],
        [
          "Herrod Chandler",
          "Sales Assistant",
          "San Francisco",
          "9608",
          "2012/08/06",
          "$137,500"
        ],
        [
          "Rhona Davidson",
          "Integration Specialist",
          "Tokyo",
          "6200",
          "2010/10/14",
          "$327,900"
        ],
        [
          "Colleen Hurst",
          "Javascript Developer",
          "San Francisco",
          "2360",
          "2009/09/15",
          "$205,500"
        ],
        [
          "Sonya Frost",
          "Software Engineer",
          "Edinburgh",
          "1667",
          "2008/12/13",
          "$103,600"
        ],
        [
          "Jena Gaines",
          "Office Manager",
          "London",
          "3814",
          "2008/12/19",
          "$90,560"
        ],
        [
          "Quinn Flynn",
          "Support Lead",
          "Edinburgh",
          "9497",
          "2013/03/03",
          "$342,000"
        ],
        [
          "Charde Marshall",
          "Regional Director",
          "San Francisco",
          "6741",
          "2008/10/16",
          "$470,600"
        ],
        [
          "Haley Kennedy",
          "Senior Marketing Designer",
          "London",
          "3597",
          "2012/12/18",
          "$313,500"
        ],
        [
          "Tatyana Fitzpatrick",
          "Regional Director",
          "London",
          "1965",
          "2010/03/17",
          "$385,750"
        ],
        [
          "Michael Silva",
          "Marketing Designer",
          "London",
          "1581",
          "2012/11/27",
          "$198,500"
        ],
        [
          "Paul Byrd",
          "Chief Financial Officer (CFO)",
          "New York",
          "3059",
          "2010/06/09",
          "$725,000"
        ],
        [
          "Gloria Little",
          "Systems Administrator",
          "New York",
          "1721",
          "2009/04/10",
          "$237,500"
        ],
        [
          "Bradley Greer",
          "Software Engineer",
          "London",
          "2558",
          "2012/10/13",
          "$132,000"
        ],
        [
          "Dai Rios",
          "Personnel Lead",
          "Edinburgh",
          "2290",
          "2012/09/26",
          "$217,500"
        ],
        [
          "Jenette Caldwell",
          "Development Lead",
          "New York",
          "1937",
          "2011/09/03",
          "$345,000"
        ],
        [
          "Yuri Berry",
          "Chief Marketing Officer (CMO)",
          "New York",
          "6154",
          "2009/06/25",
          "$675,000"
        ],
        [
          "Caesar Vance",
          "Pre-Sales Support",
          "New York",
          "8330",
          "2011/12/12",
          "$106,450"
        ],
        [
          "Doris Wilder",
          "Sales Assistant",
          "Sydney",
          "3023",
          "2010/09/20",
          "$85,600"
        ],
        [
          "Angelica Ramos",
          "Chief Executive Officer (CEO)",
          "London",
          "5797",
          "2009/10/09",
          "$1,200,000"
        ],
        [
          "Gavin Joyce",
          "Developer",
          "Edinburgh",
          "8822",
          "2010/12/22",
          "$92,575"
        ],
        [
          "Jennifer Chang",
          "Regional Director",
          "Singapore",
          "9239",
          "2010/11/14",
          "$357,650"
        ],
        [
          "Brenden Wagner",
          "Software Engineer",
          "San Francisco",
          "1314",
          "2011/06/07",
          "$206,850"
        ],
        [
          "Fiona Green",
          "Chief Operating Officer (COO)",
          "San Francisco",
          "2947",
          "2010/03/11",
          "$850,000"
        ],
        [
          "Shou Itou",
          "Regional Marketing",
          "Tokyo",
          "8899",
          "2011/08/14",
          "$163,000"
        ],
        [
          "Michelle House",
          "Integration Specialist",
          "Sydney",
          "2769",
          "2011/06/02",
          "$95,400"
        ],
        [
          "Suki Burks",
          "Developer",
          "London",
          "6832",
          "2009/10/22",
          "$114,500"
        ],
        [
          "Prescott Bartlett",
          "Technical Author",
          "London",
          "3606",
          "2011/05/07",
          "$145,000"
        ],
        [
          "Gavin Cortez",
          "Team Leader",
          "San Francisco",
          "2860",
          "2008/10/26",
          "$235,500"
        ],
        [
          "Martena Mccray",
          "Post-Sales support",
          "Edinburgh",
          "8240",
          "2011/03/09",
          "$324,050"
        ],
        [
          "Unity Butler",
          "Marketing Designer",
          "San Francisco",
          "5384",
          "2009/12/09",
          "$85,675"
        ],
        [
          "Howard Hatfield",
          "Office Manager",
          "San Francisco",
          "7031",
          "2008/12/16",
          "$164,500"
        ],
        [
          "Hope Fuentes",
          "Secretary",
          "San Francisco",
          "6318",
          "2010/02/12",
          "$109,850"
        ],
        [
          "Vivian Harrell",
          "Financial Controller",
          "San Francisco",
          "9422",
          "2009/02/14",
          "$452,500"
        ],
        [
          "Timothy Mooney",
          "Office Manager",
          "London",
          "7580",
          "2008/12/11",
          "$136,200"
        ],
        [
          "Jackson Bradshaw",
          "Director",
          "New York",
          "1042",
          "2008/09/26",
          "$645,750"
        ],
        [
          "Olivia Liang",
          "Support Engineer",
          "Singapore",
          "2120",
          "2011/02/03",
          "$234,500"
        ],
        [
          "Bruno Nash",
          "Software Engineer",
          "London",
          "6222",
          "2011/05/03",
          "$163,500"
        ],
        [
          "Sakura Yamamoto",
          "Support Engineer",
          "Tokyo",
          "9383",
          "2009/08/19",
          "$139,575"
        ],
        [
          "Thor Walton",
          "Developer",
          "New York",
          "8327",
          "2013/08/11",
          "$98,540"
        ],
        [
          "Finn Camacho",
          "Support Engineer",
          "San Francisco",
          "2927",
          "2009/07/07",
          "$87,500"
        ],
        [
          "Serge Baldwin",
          "Data Coordinator",
          "Singapore",
          "8352",
          "2012/04/09",
          "$138,575"
        ],
        [
          "Zenaida Frank",
          "Software Engineer",
          "New York",
          "7439",
          "2010/01/04",
          "$125,250"
        ],
        [
          "Zorita Serrano",
          "Software Engineer",
          "San Francisco",
          "4389",
          "2012/06/01",
          "$115,000"
        ],
        [
          "Jennifer Acosta",
          "Junior Javascript Developer",
          "Edinburgh",
          "3431",
          "2013/02/01",
          "$75,650"
        ],
        [
          "Cara Stevens",
          "Sales Assistant",
          "New York",
          "3990",
          "2011/12/06",
          "$145,600"
        ],
        [
          "Hermione Butler",
          "Regional Director",
          "London",
          "1016",
          "2011/03/21",
          "$356,250"
        ],
        [
          "Lael Greer",
          "Systems Administrator",
          "London",
          "6733",
          "2009/02/27",
          "$103,500"
        ],
        [
          "Jonas Alexander",
          "Developer",
          "San Francisco",
          "8196",
          "2010/07/14",
          "$86,500"
        ],
        [
          "Shad Decker",
          "Regional Director",
          "Edinburgh",
          "6373",
          "2008/11/13",
          "$183,000"
        ],
        [
          "Michael Bruce",
          "Javascript Developer",
          "Singapore",
          "5384",
          "2011/06/27",
          "$183,000"
        ],
        [
          "Donna Snider",
          "Customer Support",
          "New York",
          "4226",
          "2011/01/25",
          "$112,000"
        ]
      ]
    }
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

---
description: Convert data to a rendered table
---
# Table

I wrote this article which is on the tutorials section of the Jekyll docs covering this in detail - [Tabulate CSV Data](https://jekyllrb.com/tutorials/csv-to-table/).

See the short version below, for more data formats.

See also [Includes][] cheatsheet.

[Includes]: {% link cheatsheets/jekyll/liquid/includes.md %}

{% raw %}

## Render YAML data

As frontmatter on your page. Access using `page.authors`.

- `my-page.md`
  ```yaml
  ---
  title: My page
  
  authors:
    - first_name: "John"
      last_name: "Doe"
      age: 35
      location: "United States"
    
    - first_name: "Jane"
      last_name: "Doe"
      age: 29
      location: "France"
    
    - first_name: "Jack"
      last_name: "Hill"
      age: 25
      location: "Australia"
    ---
    ```

Access as `site.data.authors`.

- YAML file - `_data/authors.yaml`
    ```yaml
    - first_name: "John"
      last_name: "Doe"
      age: 35
      location: "United States"
    
    - first_name: "Jane"
      last_name: "Doe"
      age: 29
      location: "France"
    
    - first_name: "Jack"
      last_name: "Hill"
      age: 25
      location: "Australia"
    ```

Replace `author` with `page.authors` or `site.data.authors`.

```liquid
<table>
  <thead>
    <tr>
      <th>First Name</th>
      <th>Last Name</th>
      <th>Age</th>
      <th>Location</th>
    </tr>
  </thead>
  <tbody>
    {% for author in authors %}
      <tr>
        <td>{{ author.first_name }}</td>
        <td>{{ person.last_name }}</td>
        <td>{{ author.age }}</td>
        <td>{{ author.location }}</td>
      </tr>
    {% endfor %}
  </tbody>
</table>
```

## Render CSV data

Given CSV file:

- `_data/authors.csv`
  ```csv
  First name,Last name,Age,Location
  John,Doe,35,United States
  Jane,Doe,29,France
  Jack,Hill,25,Australia
  ```

### Hardcoded columns table

```liquid
<table>
  <thead>
    <tr>
      <th>First Name</th>
      <th>Last Name</th>
      <th>Age</th>
      <th>Location</th>
    </tr>
  </thead>
  <tbody>
    {% for author in site.data.authors %}
      <tr>
        <td>{{ author['First name'] }}</td>
        <td>{{ author['Last name'] }}</td>
        <td>{{ author['Age'] }}</td>
        <td>{{ author['Location'] }}</td>
      </tr>
    {% endfor %}
  </tbody>
</table>
```

### Dynamic table

Notes:

- Here using the `tablerow` builtin Liquid method to render a row. No need to add `tbody`, `tr`, or `td` elements for the rows. Note data is unpacked as a tuple of keys and values for each row, so we name this `pair` and slice it. 
- By using a inner `for` loops for the header and data rows, this approach is more flexible - it will work for any CSV and render all columns without having to reference them specifically. 

```liquid
{% assign rows = site.data.authors %}

<table>
  {% for row in rows %}
    {% if forloop.first %}
    <tr>
      {% for pair in row %}
        <th>{{ pair[0] }}</th>
      {% endfor %}
    </tr>
    {% endif %}

    {% tablerow pair in row %}
      {{ pair[1] }}
    {% endtablerow %}
  {% endfor %}
</table>
```

Since this is dynamic, you can easily move it to an `includes` file and then pass data to it and reference as:

```liquid
{% assign rows = includes.authors %}
```

{% endraw %}

---
cheatsheet:
    - title: String filters
      items:
          - cmd: append
            usage: |
                {{ 'jekyll' | append: '.jpg' }}

          - cmd: prepend
            usage: |
                {{ 'Jekyll' | prepend: 'I love ' }}

          - cmd: slice
            usage: |
                {{ "hello" | slice: 0 }} <!-- h -->
                {{ "hello" | slice: 1 }} <!-- e -->
                {{ "hello" | slice: 2, 3 }} <!-- ell -->

            help: Get items in an iterable from start index (inclusive) for a limit of items. See also `slice` in Array section and below `offset` and `limit` in the _For loops_ page.

          - cmd: markdownify
          - cmd: jsonify
            usage: |
                {{ my_var | jsonify }}
                {{ site.data.my_data | jsonify }}
          - cmd: inspect
            usage: |
                {{ my_var | inspect }}
                {{ site.page | inspect }}
            help: Show a value as a Ruby object. Useful for debugging. Especially useful if a value is possibly null and therefore invisible or if you have a data structure to understand.
          - cmd: date
          - cmd: default
            usage: |
                {% assign new_var = foo | default: 'fallback' %}
                {% assign new_var = bar.buzz | default: 'fallback' %}
          - cmd: replace
            help: Warning - if you do `replace` on an array, it converts it to a string.
          - cmd: replace_first
          - cmd: strip
          - cmd: lstrip
          - cmd: rstrip
          - cmd: capitalize
          - cmd: downcase
          - cmd: upcase

          - cmd: split
            usage: |
                {{ my_str | split: ',' }}

          - cmd: truncate
            help: Truncate a string down to x characters
          - cmd: truncatewords
            help: Truncate a string down to x words
          - cmd: strip_html
          - cmd: strip_newlines
            help: |
              Remove `\n` characters

          - cmd: newline_to_br
            help: Convert `\n` to two `br` tags

          - cmd: escape
            help: Escape HTML so that tags appear as ampersand charactes that aren't evaluated
            usage: |
                {{ "<p>Jekyll</p>" | escape }}

                Result:

                &amp;lt;p&amp;gt;Jekyll&amp;lt;/p&amp;gt;

          - cmd: uri_escape
            help: Escape a URI with percent coding
            usage: |
                {{ "foo, bar \baz?" | uri_escape }}

                Result:

                foo,%20bar%20%5Cbaz?

          - cmd: url_decode
          - cmd: url_encode

          - cmd: slugify
            usage: |
                {{ "The _config.yml file" | slugify }} <!-- the-config-yml-file -->

    - title: Array filters
      items:
          - cmd: join
            usage: |
                {{ my_array | join: ', ' }}

          - cmd: first
            usage: |
                {{ my_array | first }}

          - cmd: last
            usage: |
                {{ my_array | last }}

          - cmd: concat
            usage: |
              ---
              foo:
                - abc
                - def
              bar:
                - 123
              ---
              {{ page.foo | concat: page.bar | inspect }}
            help: Combine to arrays - parameter must be of type array to avoid error

          - cmd: slice
            usage: |
              ---
              foo: ['abc', 'def', 'ghi', 'jkl', 'mno' ]
              ---
              {{ page.foo | slice: 0 }} <!-- 1st element -->
              {{ page.foo | slice: 3 }} <!-- 4th element -->
              {{ page.foo | slice: 0, 3 }} <!-- First three elements -->
              {{ page.foo | slice: 1, 3 }} <!-- First 3 elements starting at 2nd element -->
            help: Get an item by index. Or with two values as a range, set a start index and a count of elements. See also `offset` and `limit` on the _For loops_ page.

          - cmd: map
            usage: |
              {{ my_array | map: "some_attribute" }}

          - cmd: where
            usage: |
              {{ site.posts | where: "category", "foo" }}
              {{ page.people | where: "school", "Stanford" }}
            help: A simple filter where an attribute value matches a given value.
          - cmd: where_exp
            usage: |
                {{ page.people | where_exp: "item", "item.name contains 'Jo'" }}
                {{ page.people | where_exp: "item", "item.year >= 2016" }}
                {{ page.people | where_exp: "item", "item.school != "Stanford" }}
            help: A filter where a given expression is true.
          - cmd: group_by
            usage: |
              {{ page.people | group_by: country }}
              <!--
                Source:
                    [ [name: 'Joe', country: 'England'], [name: 'Sally', country: 'England']
                Result:
                    { England: [ [name: 'Joe', country: 'England'], [name: 'Sally', country: 'England'] ] }
              -->
            help: |
                Group an array's items by a given property. You'll get a hash where that attribute is used as the key and the value is all the match items (the attribute is not removed).
          - cmd: group_by_exp
            usage: |
                {{ page.people | group_by_exp: "item", "item.name | size" }}
                {{ page.people | group_by_exp: "item", "item.year | modulo: 2" }}
                {{ page.people | group_by_exp: "item", "item.country | replace: 'rd', 'ry' " }}
            description: Group an array's items using a Liquid expression.

          - cmd: size
            usage: |
                {{ my_array | size }}

          - cmd: reverse
            usage: |
                {{ my_array | reverse }}

          - cmd: sort
            usage: |
                {{ my_array | sort }}
                {{ page.posts | sort: 'author' }}

          - cmd: sort_natural
            usage: |
                {% assign my_array = "zebra, octopus, giraffe, Sally Snake" | split: ", " %}
                {{ my_array | sort_natural | join: ", " }}
            help: Sorts items in an array in case-insensitive order

          - cmd: uniq
            usage: |
                {{ my_array | uniq }}
                {{ my_array | sort | uniq }}
            help: You don't _have_ to sort, but if you do then your results will read better.
          - cmd: push
            usage: |
                {% assign my_array = my_array | push: 'my value ' %}
            help: Insert at the end of the array

          - cmd: pop
            usage: |
                {% assign value = my_array | pop %}
                {% assign value = my_array | pop: 1 %}
            help: Remove an item from the end of an array. Accepts optional param `num` which defaults to `1`

          - cmd: unshift
            usage: |
                {% assign my_array = my_array | unshift: 'my value ' %}
            help: Insert at the start of the array

          - cmd: shift
            usage: |
                {% assign value = my_array | shift %}
                {% assign value = my_array | shift: 1 %}
            help: Remove an item from the start of an array. Accepts optional param `num` which defaults to `1`

          - cmd: compact
            usage: |
                {% assign site_categories = site.pages | map: "category" | compact %}
            help: Removes any nil values from an array.

    - title: Maths
      items:
          - cmd: plus
            usage: |
                {{ 4 | plus: 2 }}
          - cmd: minus
          - cmd: times
          - cmd: divided_by
          - cmd: modulo
          - cmd: floor
          - cmd: ceil
          - cmd: round
          - cmd: abs
          - cmd: at_least
            usage: |
                {{ 4 | at_least: 3 }} <!-- 3 -- >
            help: Limits a number to a minimum value. Same as `min(a, b)` in other languages.
          - cmd: at_most
            help: Limits a number to a maximum value. Same as `max(a, b)` in other languages.

---
# All filters

Grouped by functionality.

This is a based info on the [CloudCannon Jekyll cheatsheet][]. See also [Liquid filters][] on Jekyll docs.

The items here are grouped and ordered by use, rather than alpabetically.

For escaping a URI:

- `url_escape`
- `cgi_escape`

For escaping HTML tags:

- `xml_escape`
- `escape`
- `escape_once`

See also the [Arrays][] cheatsheet.

<!-- Note - highlight or pre causes the code to be on a newline but code doesn't and is like single ticks. -->

{% for section in page.cheatsheet %}
### {{ section.title }}

<ul>
{% for item in section.items %}
    <li>
        <code>{{ item.cmd }}</code>
        {% if item.help %}
            <i>{{ item.help | markdownify }}</i>
        {% endif %}
        {% if item.usage %}
            {% highlight liquid %}{{ item.usage  }}{% endhighlight %}
        {% endif %}
    </li>
{% endfor %}
</ul>

{% endfor %}

[CloudCannon Jekyll cheatsheet]: https://cloudcannon.com/community/jekyll-cheat-sheet/
[Liquid filters]: https://jekyllrb.com/docs/liquid/filters/
[Arrays]: {% link cheatsheets/jekyll/liquid/arrays.md %}

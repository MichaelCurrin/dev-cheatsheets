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
                {{ "hello" | slice: 0 }}
                {{ "hello" | slice: 1, 3 }}

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
          - cmd: escape_once
          - cmd: url_decode
          - cmd: url_encode

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
              foo: ['abc', 'def', 'ghi', 'jkl' ]
              ---
              {{ page.foo | slice: 0 | inspect }} <!-- ['abc'] -->
              {{ page.foo | slice: 1, 3 | inspect }} <!-- ["def", "ghi", "jkl"] -->

          - cmd: map
            usage: |
              {{ my_array | map: "some_attribute" }}

          - cmd: where
            usage: |
              {{ site.posts | where:"category","foo" }}
              {{ page.people | where: "school", "Stanford" }}

          - cmd: where_expr
            usage: |
                {{ page.people | where_exp: "item", "item.name contains 'Jo'" }}
                {{ page.people | where_exp: "item", "item.year >= 2016" }}
                {{ page.people | where_exp: "item", "item.school != "Stanford" }}

          - cmd: group_by
            help: |
                Provide the attribute name for an array of hashes and you'll create an array of hashes with name as a string and items as an array of the original values (the attribute won't be removed)

          - cmd: group_by_exp
            usage: |
                {{ page.people | group_by_exp: "item", "item.name | size" }}
                {{ page.people | group_by_exp: "item", "item.year | modulo: 2" }}
                {{ page.people | group_by_exp: "item", "item.school | replace: 'rd', 'ry' " }}

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
          - cmd: at_most
---
# All filters

Grouped by functionality.

This is a based info on the [CloudCannon Jekyll cheatsheet](https://learn.cloudcannon.com/jekyll-cheat-sheet/). See also [Liquid filters](https://jekyllrb.com/docs/liquid/filters/) on Jekyll docs.

The items here are grouped and ordered by use, rather than alpabetically.

<!-- Note - highligh or pre causes the code to be on a newline but code doesn't and is like single ticks. -->

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

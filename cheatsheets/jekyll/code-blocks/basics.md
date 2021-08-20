---
description: Backticks vs highlight tag
---
# Basics


## Markdown code blocks

This works in Jekyll and plain markdown too.

Code:

    ```ruby
    def foo
      puts 'foo'
    end
    ```

Result:

```ruby
def foo
  puts 'foo'
end
```


## Highlight tag

This works in Jekyll only.

Code:

{% raw %}
```liquid
{% highlight ruby %}
def foo
  puts 'foo'
end
{% endhighlight %}
```
{% endraw %}

Result:

{% highlight ruby %}
def foo
  puts 'foo'
end
{% endhighlight %}

### With line numbers

Add `linenos` to the `highlight` tag. 

Code:

{% raw %}
```liquid
{% highlight ruby linenos %}
def foo
  puts 'foo'
end
{% endhighlight %}
```
{% endraw %}

Result:

{% highlight ruby linenos %}
def foo
  puts 'foo'
end
{% endhighlight %}

Here is the HTML result:

```html
<table class="rouge-table"><tbody><tr><td class="gutter gl"><pre class="lineno">1
2
3
</pre></td><td class="code"><pre><span class="k">def</span> <span class="nf">foo</span>
  <span class="nb">puts</span> <span class="s1">'foo'</span>
<span class="k">end</span>
</pre></td></tr></tbody></table>
```

Warning: You may need to add or update your CSS so that the result displays as you expect. For example, in Minima, the width must be reduced to not be 100% and the borders must be removed:

Code:

```html
<style>
.rouge-table {
	width: initial;
}
table {
	border: none;
}
table td {
	border: none;
}
td pre {
	border: none;
}
</style>
```

<!-- Applied but not visible code on this page. -->

<style>
.rouge-table {
	width: initial;
}
table {
	border: none;
}
table td {
	border: none;
}
td pre {
	border: none;
}
</style>


## Bullet or numbered points

Using code indented 4 spaces inside a point.

Code:

```markdown
1. Create a new logical volume group 
    ```yaml
    - name: Create a volume group on top of /dev/sdb
  community.general.lvg:
      vg: vg.storage
      pvs: /dev/sdb1
      pesize: 32
    ```
2. Create a logical volume in your logical volume group
    ```yaml
    - name: create logical volume
      community.general.lvol:
        vg: vg.storage
        lv: data
        size: 10g
    ```

Result:

1. Create a new logical volume group 
    ```yaml
    - name: Create a volume group on top of /dev/sdb
  community.general.lvg:
      vg: vg.storage
      pvs: /dev/sdb1
      pesize: 32
    ```
2. Create a logical volume in your logical volume group
    ```yaml
    - name: create logical volume
      community.general.lvol:
        vg: vg.storage
        lv: data
        size: 10g
    ```


## Escape

Add backslash before backticks.

Code:

   \`\`\`

Result:

\`\`\`

Or indent 4 spaces.

Code:

```markdown 
     ```sh
     $ echo 'Hello'
     ```
```

Result:

     ```sh
     $ echo 'Hello'
     ```

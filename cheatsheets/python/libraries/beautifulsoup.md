# BeautifulSoup


## Resources

- [Read the docs](https://beautiful-soup-4.readthedocs.io/en/latest/) docs
- [Read the docs](https://readthedocs.org/projects/beautiful-soup-4/) project page
- [PyPI](https://pypi.org/project/beautifulsoup4/)
- Tutorials
    - [Python for beginners](https://www.pythonforbeginners.com/beautifulsoup/beautifulsoup-4-python)
    - [Zetcode](http://zetcode.com/python/beautifulsoup/)


## Install

### Install BeautifulSoup

Use `pip` to install:

```
beautifulsoup4
```

Note: Don't use `beautifulsoup`. You can use `bs4` but that's just a wrapper fixed at `0.0.1` so don't use that.


### Install a parser

See [Installing a parse](https://beautiful-soup-4.readthedocs.io/en/latest/index.html?highlight=get#installing-a-parser) in the docs.

Choose a parser. The guide linked also compares them and those are covered here.

If you get an invalid document error, you can try changing your parser as they parse differently.

#### Python's parser

Not as fast as LXML and not as leniant as HTML5Lib.

No installation needed.

```
html.parser
```

Use like this:

```python
BeautifulSoup(markup, "html.parser")
```

#### LXML

Link: [lxml.de/](https://lxml.de/)


Use `pip` to install:

```
lxml
```

Or:

```sh
apt-get install python-lxml
```

Use like this:

- HTML parsing
    ```python
    BeautifulSoup(markup, "lxml")
    ```
- XML parsing
    ```python
    BeautifulSoup(markup, "lxml-xml")
    # OR
    BeautifulSoup(markup, "xml")
    ```


### HTML5Lib

Described in the docs as "very slow", so only covered briefly here:

Use like this:

```python
BeautifulSoup(markup, "html5lib")
```


## Import


```python
from bs4 import BeautifulSoup
```

## Make soup


### Syntax

```python
soup = BeautifulSoup(markup, features) 
```

Mark up as a string of file object. 

Feature is usually `lxml`. This could be made a global constant if used repeatedly.

From docstring:

```
        :param markup: A string or a file-like object representing
         markup to be parsed.

        :param features: Desirable features of the parser to be
         used. This may be the name of a specific parser ("lxml",
         "lxml-xml", "html.parser", or "html5lib") or it may be the
         type of markup to be used ("html", "html5", "xml"). It's
         recommended that you name a specific parser, so that
         Beautiful Soup gives you the same results across platforms
         and virtual environments.

        :param builder: A TreeBuilder subclass to instantiate (or
         instance to use) instead of looking one up based on
         `features`. You only need to use this if you've implemented a
         custom TreeBuilder.

        :param parse_only: A SoupStrainer. Only parts of the document
         matching the SoupStrainer will be considered. This is useful
         when parsing part of a document that would otherwise be too
         large to fit into memory.

        :param from_encoding: A string indicating the encoding of the
         document to be parsed. Pass this in if Beautiful Soup is
         guessing wrongly about the document's encoding.

        :param exclude_encodings: A list of strings indicating
         encodings known to be wrong. Pass this in if you don't know
         the document's encoding but you know Beautiful Soup's guess is
         wrong.

        :param element_classes: A dictionary mapping BeautifulSoup
         classes like Tag and NavigableString, to other classes you'd
         like to be instantiated instead as the parse tree is
         built. This is useful for subclassing Tag or NavigableString
         to modify default behavior.

        :param kwargs: For backwards compatibility purposes, the
         constructor accepts certain keyword arguments used in
         Beautiful Soup 3. None of these arguments do anything in
         Beautiful Soup 4; they will result in a warning and then be
         ignored.
         
         Apart from this, any keyword arguments passed into the
         BeautifulSoup constructor are propagated to the TreeBuilder
         constructor. This makes it possible to configure a
         TreeBuilder by passing in arguments, not just by saying which
         one to use.
```

### Read string

```python
markup = "<div>Hello, world!</div>"
soup = BeautifulSoup(markup, 'lxml')
```

### Read local text file

Note you do not need to use `f_in.read()`.

```python
with open("index.html", "r") as f_in:
    soup = BeautifulSoup(f_in, 'lxml')
```

### Read webpage

```python
resp = requests.get(url)

if resp.ok:
    soup = BeautifulSoup(resp.text, 'lxml')
else:
    print(resp.status_code)
```

## Find elements

### Get by attribute

Get the _first_ element or `None`.

```python
soup.html

soup.head
```

```python
soup.h2.name
# h2
soup.h2.text
# My header
```

### Use find

Get the first element matching search and any attribute filters.

```python
tag = soup.find_all(attrs={"name" : "stainfo"})
```

```python
soup.find("ul", attrs={ "id" : "mylist" } ))
# OR
soup.find("ul", id="mylist")) 
```

To narrow down a search, you can use an element in place of soup.

```python
el.find(...)
```

Or use a nested CSS selector.


### Use find_all

Get all elements.

```python
tags = soup.find_all("li"):
```

Use a list.


```python
tags = soup.find_all(["h2", "p"]):
```

Use a function.

```python
def is_empty(tag):
    return tag.is_empty_element
    
tags = soup.find_all(is_empty):
```


### Use select_one

CSS selector.

```python
tag = soup.select_one("#mylist")
```

### Use selector

CSS selector.

Get third element.

```python
tags = soup.select("li:nth-of-type(3)")
```

## Attributes

For string: `'<div id="foo" class="question" name="python" x="something">Hello World</div>'`

### Get

```python
el.get('id')
# > 'foo
```

### Attrs

```python
el.attrs
# => {'id': 'foo', 'x': 'something', 'class': ['question'], 'name': 'python'}

el.attrs['id']
# => 'foo'

# Safer dict lookup which can return None for no key found.
el.attrs.get('id')
# => 'foo'
```

### Get all URLs

```python
for link in soup.find_all('a'):
    print(link.get('href'))
```

### Get all text on the page

```python
soup.get_text())
```

## Traversing

### Children

Direct descendants.

```python
el.children
```

### Descendents

All levels.


```python
el.descendants
```

### Parent

```python
el.parent
```

### Traverse recursively

```python
with open("index.html", "r") as f_in:
    contents = f_in.read()
    soup = BeautifulSoup(contents, 'lxml')
            
    for child in soup.recursiveChildGenerator():
        if child.name:
            print(child.name)
```

## Modify

### Create

```python
new_tag = soup.new_tag('li')
new_tag.string='Foo'

ul_tag = soup.ul
```

### Append


```python
ul_tag.append(new_tag)
```

### Insert

Insert at 3rd position:

```python
ul_tag.append(2, new_tag)
```


### Replace

```python
tag = soup.find(text="Windows")
tag.replace_with("OpenBSD")
```

### Remove

```python
tag.decompose()
```

## Prettify


```python
print(soup.prettify))
```

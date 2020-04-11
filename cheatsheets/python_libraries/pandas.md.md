# Pandas cheatsheet


## Resources

- [pandas.pydata.org](https://pandas.pydata.org/) official site. 
	- Getting Started
	- Docs
	- Community
- [pandas-dev/pandas](https://github.com/pandas-dev/pandas) on Github.
- [Pandas 0.25](https://devdocs.io/pandas~0.25/) on DevDocs
- Tutorials
	- [Pandas basics](https://www.learnpython.org/en/Pandas_Basics)

## Cheatsheets

- [Pandas Cheat Sheet](https://pandas.pydata.org/Pandas_Cheat_Sheet.pdf) PDF on main site.

## Usage

Commands in Pandas which I have used or would like to use. This is not meant to be complete, but cover some common usage situations or some tricky or obscure syntax.

```python
import pandas as pd
```

### Create dataframe

#### Column-input

With `data` as a `dict` where key is column name and value is a list of values. 

```python
data = {"a" : [4 ,5, 6], "b" : [7, 8, 9], "c" : [10, 11, 12]}
df = pd.DataFrame(
    data,
    indexes=[1, 2, 3],
)
```

#### Row input

With `data` as a 2-D list - a list of rows where each row is a list. Columns must be named.

```python
data = [[4, 7, 10],[5, 8, 11],[6, 9, 12]]
df = pd.DataFrame(
    data, 
    indexes=[1, 2, 3],
    columns=['a', 'b', 'c'],
)
```

### Select and filter

Get column.

```python
df['foo']

df.foo
```

Get columns.

```python
df[['foo', 'bar']]
```

Get columns of name matching pattern.

```python
df.filter(regex='foo')
```


Select _range_ of named columns, inclusive.

```python
df.loc[:,'foo':'bar']
```

Select individual columns by index.

```python
df.iloc[:,[0, 2 ,5]]
```

Also filter by condition.

```python
df.loc[df['a'] > 10, ['a','c']]
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTkzNTk4MTQ0XX0=
-->
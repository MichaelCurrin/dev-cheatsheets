---
title: Pandas
---

Commands in Pandas which I have used or would like to use. This is not meant to be complete, but cover some common usage situations or some tricky or obscure syntax.

- [Homepage](https://pandas.pydata.org/)
- [Docs](https://pandas.pydata.org/docs/)

See also:

- [Pandas Cheat Sheet](https://pandas.pydata.org/Pandas_Cheat_Sheet.pdf) PDF on Pandas main site.
- [Pands](https://github.com/MichaelCurrin/learn-to-code/blob/master/en/topics/scripting_languages/Python/libraries/pandas.md) on Learn to Code.


## Imports

```python
import numpy as np
import pandas as pd
```


## Types

- `pd.Series`
- `pd.GroupBy`
-  `pd.DataFrame`


## Create dataframe

### Column-input

With `data` as a `dict` where key is column name and value is a list of values.

```python
data = {"a" : [4 ,5, 6], "b" : [7, 8, 9], "c" : [10, 11, 12]}
df = pd.DataFrame(
    data,
    indexes=[1, 2, 3],
)
```

### Row input

With `data` as a 2-D list - a list of rows where each row is a list. Columns must be named.

```python
data = [[4, 7, 10],[5, 8, 11],[6, 9, 12]]
df = pd.DataFrame(
    data,
    indexes=[1, 2, 3],
    columns=['a', 'b', 'c'],
)
```

## Select and filter

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

## Summarize

Row count.

```python
len(df)
```

Get pairs of values and frequency, sorted by frequency descending.

```python
df['foo'].value_counts()
```
e.g.

```python
df = pd.Series([2, 2, 5, 3, 4, np.nan])
df.value_counts()
# 2.0    2
# 4.0    1
# 3.0    1
# 5.0    1
```

Distinct values. Does not sort.

```python
df['foo'].nunique()
```
e.g.

```python
> pd.Series([2, 4, 3, 3], name='P').unique()
# => array([2, 4, 3], dtype=int64)
```

Basic descriptive statistics for each column

```python
df.describe()
```

### Functions

Calculations on a column or possibly dataframe.

- `.count()`
- `.sum()`
- `.min()`
- `.max()`
- `.mean()`
- `.median()`
- `.var()`
- `.std()`
- `.quantile([0.25,0.75]`
- `.apply(function)`


### Group by

Get `GroupBy` object.

Column.

```python
df.groupby(by="foo")
```

Index.
```python
df.groupby(level="foo")
```

Size of group.

```python
.size()
```

### Plot

Histogram for each column.

```python
df.plot.hist()
```

Scatter chart using pairs of points.

```python
df.plot.scatter(x='foo', y='bar')
```

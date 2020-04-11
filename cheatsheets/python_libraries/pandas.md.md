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
df = pd.DataFrame(data, indexes=[1, 2, 3])
```

#### Row input

With `data` as a 2-D list - a list of rows where each row is a list 



<!--stackedit_data:
eyJoaXN0b3J5IjpbLTk1OTU4OTMxNF19
-->
---
title: Seaborn
description: |
  "statistical data visualization"
---


## What is Seaborn?

From the docs:

> Seaborn is a Python data visualization library based on **matplotlib**. It provides a high-level interface for drawing attractive and informative statistical graphics.


## Resources

- [Homepage](https://seaborn.pydata.org/)
- [Gallery](https://seaborn.pydata.org/examples/index.html) - heatmap, bar chart, relationship map, catblot, boxplot, scatterplot, etc.

## Examples

From [Introduction](https://seaborn.pydata.org/introduction.html) page. 

> Seaborn is a library for making statistical graphics in Python. It builds on top of **matplotlib** and integrates closely with **pandas** data structures.
>
> Seaborn helps you explore and understand your data. Its plotting functions operate on dataframes and arrays containing whole datasets and internally perform the necessary semantic mapping and statistical aggregation to produce informative plots. Its dataset-oriented, declarative API lets you focus on what the different elements of your plots mean, rather than on the details of how to draw them.

### Basic

Here using default theme. 

Using a sample dataset - you could also load a CSV with `pandas.read_csv()`.

```python
import seaborn as sns


sns.set_theme()

tips = sns.load_dataset("tips")
sns.relplot(
    data=tips,
    x="total_bill", y="tip", col="time",
    hue="smoker", style="smoker", size="size",
)
```

This uses a _relationship_ plot, which can be styled for various cases.

Here we switch styling with `kind`.

```python
dots = sns.load_dataset("dots")
sns.relplot(
    data=dots, kind="line",
    x="time", y="firing_rate", col="align",
    hue="choice", size="coherence", style="choice",
    facet_kws=dict(sharex=False),
)
```

### Statistical estimation and error bars

```python
fmri = sns.load_dataset("fmri")
sns.relplot(
    data=fmri, kind="line",
    x="timepoint", y="signal", col="region",
    hue="event", style="event",
)
```

Add a linear regression model and its uncertainty.

```python
sns.lmplot(
  data=tips, 
  x="total_bill", y="tip", col="time",
  hue="smoker"
)
```

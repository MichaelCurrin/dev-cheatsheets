# Formatting

From [Stacked](https://apexcharts.com/javascript-chart-demos/bar-charts/stacked/).

```js
{
  xaxis: {
          categories: [2008, 2009, 2010, 2011, 2012, 2013, 2014],
    labels: {
      formatter: function (val) {
        return val + "K"
      }
    }
  },
}
```

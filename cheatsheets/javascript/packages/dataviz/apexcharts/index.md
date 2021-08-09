# ApexCharts


Note that mixed Y axes are only allowed for line chart (not bar) and that must also be standard orientation.

### Formatting

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

### Logarithm

From [Multiple Y-axis scales](https://apexcharts.com/docs/chart-types/multiple-yaxis-scales/).

```js
{
  series: [
    {
      name: 'Linear',
      data: [1, 20, 14, 45, 15, 28, 38, 46]
    },
    {
      name: 'Logarithmic',
      data: [10000, 124400, 244223, 3665232, 73452344, 875230623]
    }
  ],
  yaxis: [
    {
      seriesName: 'Linear',
    },
    {
      seriesName: 'Logarithmic',
      logarithmic: true
    }
  ],
}
```

# Logarithm

From [Multiple Y-axis scales](https://apexcharts.com/docs/chart-types/multiple-yaxis-scales/).

```javascript
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

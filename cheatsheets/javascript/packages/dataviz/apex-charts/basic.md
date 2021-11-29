# Basic

Based on [Creating Your First JavaScript Chart][] in the docs.


```javascript
const data = [30, 40, 35, 50, 49, 60, 70, 91, 125]
const categories = [1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999]

const options = {
  chart: {
    type: 'line'
  },
  series: [{
    name: 'sales',
    data
  }],
  xaxis: {
    categories
  }
}

const chart = new ApexCharts(document.querySelector("#chart"), options);

chart.render();
```

[Creating Your First JavaScript Chart]: https://apexcharts.com/docs/creating-first-javascript-chart/

<template>
  <div>
    <div class="jaspioncoin">
      <h2>Jaspioncoin (JPN)</h2>
      <p>Atualizado em tempo real.</p>
    </div>
    <div id="chartdiv" ref="chartdiv" />
  </div>
</template>

<style>
  #chartdiv {
    width: 100%;
    height: 75vh;
  }

  .jaspioncoin {
    display: flex;
    justify-content: center;
    align-items: flex-start;
    flex-direction: column;
    padding: 10px 40px;
  }

  p {
    font-size: 12px;
  }
</style>

<!-- Chart code -->
<script>
  import * as am4core from "@amcharts/amcharts4/core"
  import * as am4charts from "@amcharts/amcharts4/charts"
  import am4themes_animated from "@amcharts/amcharts4/themes/animated"
  import am4themes_material from "@amcharts/amcharts4/themes/material"

  am4core.useTheme(am4themes_animated)
  am4core.useTheme(am4themes_material)

  var cripto_values

  export default {
    name: 'Jaspioncoin',
    
    data: cripto_values,
    
    methods: {
      formatDate(date) {
        // let dia = date.getDate()
        let mes = [
          'Jan', 'Fev', 'Mar', 'Abr',
          'Mai', 'Jun', 'Jul', 'Ago', 'Set', 
          'Out', 'Nov', 'Dez'
        ][date.getMonth()]
        let ano = date.getFullYear()
        
        return `${mes}/${ano}`
      }
    },

    beforeMount() {
        var supportsWebSockets = 'WebSocket' in window || 'MozWebSocket' in window;
        if (supportsWebSockets) {

          var ws = new WebSocket("ws://localhost:5000")

          ws.onopen = function () {
              console.log("open ws")
          }

          ws.onmessage = function (evt) {
              var received_msg = evt.data
              cripto_values = received_msg
          }

          ws.onclose = function () {
              console.log("Connection is closed...")
          }
        } else {
          alert("WebSocket NOT supported by your Browser!")
        }
      },

    mounted() {
      let chart = am4core.create(this.$refs.chartdiv, am4charts.XYChart)

      chart.paddingRight = 40

      let data = []
      let values = 0
      let data_atual = new Date()

      data.push({ 
        date: this.formatDate(data_atual), 
        name: "JaspionCoin", 
        value: values 
      })

      chart.data = data

      let dateAxis = chart.xAxes.push(new am4charts.DateAxis())
      dateAxis.renderer.grid.template.location = 0
      dateAxis.minZoomCount = 1
      dateAxis.maxZoomCount = 500

      var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
      valueAxis.tooltip.disabled = false;
      valueAxis.renderer.minWidth = 35
      valueAxis.interpolationDuration = 500;
      valueAxis.rangeChangeDuration = 500;
      valueAxis.renderer.inside = true;
      valueAxis.renderer.minLabelPosition = 0.10;
      valueAxis.renderer.maxLabelPosition = 0.90;
      valueAxis.renderer.ticks.template.disabled = true;
      valueAxis.renderer.minGridDistance = 30;

      var series = chart.series.push(new am4charts.LineSeries())
      series.dataFields.dateX = "date"
      series.dataFields.valueY = "value"
      series.tooltipText = "{valueY}"
      series.tooltip.pointerOrientation = "vertical"
      series.tooltip.background.fillOpacity = 0.8
      series.tensionX = 0.7
      series.fill = am4core.color("#EFAF26");
      series.stroke = am4core.color("#EFAF26");
      series.strokeWidth = 2;

      chart.cursor = new am4charts.XYCursor()
      chart.cursor.xAxis = dateAxis

      let scrollbarX = new am4charts.XYChartScrollbar()
      scrollbarX.series.push(series)
      chart.scrollbarX = scrollbarX


      // bullet at the front of the line
      var bullet = series.createChild(am4charts.CircleBullet)
      bullet.circle.radius = 5
      bullet.fillOpacity = 0.9
      bullet.fill = chart.colors.getIndex(0)
      bullet.isMeasured = false

      series.events.on("validated", function() {
        bullet.moveTo(series.dataItems.last.point)
        bullet.validatePosition()
      });

      this.chart = chart

      var interval;
      document.addEventListener("visibilitychange", function() {
        if (document.hidden) {
          if (interval) {
            clearInterval(interval);
          }
        } else {
          startInterval();
        }
      }, true);

      function startInterval() {
        interval = setInterval(function() {
          var lastdataItem = series.dataItems.getIndex(series.dataItems.length - 1);

          if(cripto_values !== "OK") {
            var sortKey = JSON.parse(cripto_values)
            for(var key of Object.keys(sortKey)){
              if(key === "jaspion_coin_value") {
                values = cripto_values
              }
            }
          }

          chart.addData({ 
            date: new Date(lastdataItem.dateX.getTime() + 1000), 
            value: values 
          });
        }, 500)
      }
      startInterval()
    },

    beforeDestroy() {
      if (this.chart) {
        this.chart.dispose()
      }
    },
  }
</script>
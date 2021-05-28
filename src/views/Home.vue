<template>
  <div class="home">
    <!-- <div class="home_img">
      <img class="efeito-flutuante" src="../assets/img/jaspion.png" width="30%"/>
      <img class="efeito-flutuante" src="../assets/img/jiraya.png" width="27%"/>
      <img class="efeito-flutuante" src="../assets/img/jiban.png" width="16%"/>
    </div> -->
    <div v-for="criptomoeda in criptomoedas" :key="criptomoeda.id">
      <h3>{{ criptomoeda }}</h3>
    </div>
    <div class="home-title">
      <h1>Bem vindo ao Crypto J.</h1> 
      <p>Temos informações em tempo real das maiores criptomoedas do mercado financeiro.</p>
      <p>Acompanhe as criptomoedas Jaspioncoin, Jibancoin e a Jirayacoin!</p>
      <p>No menú acima você encontra os gráficos individuais em <b>TEMPO REAL</b>, e no gráfico abaixo você pode ver o <b>histórico</b> do último ano das <i>3 principais criptomoedas!</i></p>
    </div>
    <div class="home-body">
      <div id="chartdiv" ref="chartdiv" />
    </div>
  </div>
</template>

<style>
  #chartdiv {
    width: 500px;
    height: 50vh;
  }

  @keyframes float{
    0%,100%{
      transform:translatey(0)
    }
    50%{
      transform:translatey(-20px)
    }
  }
  .efeito-flutuante, .elementor-image img {
      animation: float 6s ease-in-out infinite;
      margin: -70px;
  }

  h1 {
    color: #173244;
    padding-bottom: 20px;
  }
  .home-title p {
    padding: 0 20px;
  }
  .home-title p {
    font-size: 14px;
  }
</style>

<script>
  import * as am4core from "@amcharts/amcharts4/core"
  import * as am4charts from "@amcharts/amcharts4/charts"
  import am4themes_animated from "@amcharts/amcharts4/themes/animated"
  import am4themes_material from "@amcharts/amcharts4/themes/material"
  import { mapState } from 'vuex'

  am4core.useTheme(am4themes_animated)
  am4core.useTheme(am4themes_material)

  export default {
    computed: {
      ...mapState('criptomoedas', ['criptomoedas'])
    },
    created() {
      this.$store.dispatch('criptomoedas/loadCriptos')
    },
    mounted: function() {
      // Create chart
      var chart = am4core.create("chartdiv", am4charts.XYChart);

      var data = [];
      var values1 = 2.3980, values2 = 0.8662, values3 = 3.9873;
      for (var i = 1; i <= 365; i++) {
        values1 += (Math.round((Math.random()) < 0.5 ? 1 : -0.8) * Math.random() * 10);
        data.push({ date1: new Date(2020, 0, i), values1: values1 });
      }
      for (var j = 1; j <= 365; j++) {
        values2 += Math.round((Math.random() < 0.5 ? 1 : -0.9) * Math.random() * 10);
        data.push({ date2: new Date(2020, 0, j), values2: values2 });
      }
      for (var k = 1; k <= 365; k++) {
        values3 += Math.round((Math.random() < 0.5 ? 1 : -1) * Math.random() * 10);
        data.push({ date3: new Date(2020, 0, k), values3: values3 });
      }

      chart.data = data;

      var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
      dateAxis.renderer.grid.template.location = 0;
      dateAxis.renderer.labels.template.fill = am4core.color("#33AD49");

      var dateAxis2 = chart.xAxes.push(new am4charts.DateAxis());
      dateAxis2.renderer.grid.template.location = 0;
      dateAxis2.renderer.labels.template.fill = am4core.color("#EFAF26");

      var dateAxis3 = chart.xAxes.push(new am4charts.DateAxis());
      dateAxis3.renderer.grid.template.location = 0;
      dateAxis3.renderer.labels.template.fill = am4core.color("#244D68");

      var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
      valueAxis.tooltip.disabled = true;
      valueAxis.renderer.labels.template.fill = am4core.color("#33AD49");
      valueAxis.renderer.minWidth = 60;

      var valueAxis2 = chart.yAxes.push(new am4charts.ValueAxis());
      valueAxis2.tooltip.disabled = true;
      valueAxis2.renderer.labels.template.fill = am4core.color("#EFAF26");
      valueAxis2.renderer.minWidth = 60;
      valueAxis2.syncWithAxis = valueAxis;

      var valueAxis3 = chart.yAxes.push(new am4charts.ValueAxis());
      valueAxis3.tooltip.disabled = true;
      valueAxis3.renderer.labels.template.fill = am4core.color("#244D68");
      valueAxis3.renderer.minWidth = 60;
      valueAxis3.syncWithAxis = valueAxis;

      var series = chart.series.push(new am4charts.LineSeries());
      series.name = "Jibancoin";
      series.dataFields.dateX = "date1";
      series.dataFields.valueY = "values1";
      series.tooltipText = "{valueY.value}";
      series.fill = am4core.color("#33AD49");
      series.stroke = am4core.color("#33AD49");

      var series2 = chart.series.push(new am4charts.LineSeries());
      series2.name = "Jaspioncoin";
      series2.dataFields.dateX = "date2";
      series2.dataFields.valueY = "values2";
      series2.yAxis = valueAxis2;
      series2.xAxis = dateAxis2;
      series2.tooltipText = "{valueY.value}";
      series2.fill = am4core.color("#EFAF26");
      series2.stroke = am4core.color("#EFAF26");

      var series3 = chart.series.push(new am4charts.LineSeries());
      series3.name = "Jirayacoin";
      series3.dataFields.dateX = "date3";
      series3.dataFields.valueY = "values3";
      series3.yAxis = valueAxis3;
      series3.xAxis = dateAxis3;
      series3.tooltipText = "{valueY.value}";
      series3.fill = am4core.color("#244D68");
      series3.stroke = am4core.color("#244D68");

      chart.cursor = new am4charts.XYCursor();
      chart.cursor.xAxis = dateAxis2;

      var scrollbarX = new am4charts.XYChartScrollbar();
      scrollbarX.series.push(series);
      chart.scrollbarX = scrollbarX;

      chart.legend = new am4charts.Legend();
      chart.legend.parent = chart.plotContainer;
      chart.legend.zIndex = 100;

      dateAxis.renderer.grid.template.strokeOpacity = 0.07;
      valueAxis.renderer.grid.template.strokeOpacity = 0.07;

      valueAxis2.renderer.grid.template.strokeOpacity = 0.07;
      dateAxis2.renderer.grid.template.strokeOpacity = 0.07;

      valueAxis3.renderer.grid.template.strokeOpacity = 0.07;
      dateAxis3.renderer.grid.template.strokeOpacity = 0.07;
    }
  }
</script>
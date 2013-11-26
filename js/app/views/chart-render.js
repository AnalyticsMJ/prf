define(['underscore', 'goog!visualization,1,packages:[corechart]'], function(_) {
  return function (argument) {
    this.showSeverityChart = function(stats) {
      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Gravidade');
      data.addColumn('number', 'Acidentes'); 
      data.addRows(_.map(stats, function(d) {
        return [d.gravidade, d.qtd_ocorrencia]
      }));
      var options = { 
            colors: ['#EFA190','#EF846E','#DF5A3E','#912A14'],
            width: '100%', height: '100%',
            animation: { duration: 1000 },
            backgroundColor: 'transparent',
            chartArea:{ width: '100%', height: '75%'},
            tooltip: {text: 'percentage'},
            legend: { position: 'none'},
            reverseCategories: true,
            titlePosition: 'none', 
            axisTitlesPosition: 'none',
            hAxis: {textPosition: 'out'}, vAxis: {textPosition: 'in'}                 
          };
          
      var chart = new google.visualization.BarChart(document.getElementById('severity')); 
      chart.draw(data, options);
      $(window).resize(_.debounce(function() {
        chart.draw(data, options);
      }, 500));
    };
     
    this.showByHourChart = function(stats) {
      var data = new google.visualization.DataTable();
      data.addColumn('number', 'Hora');
      data.addColumn('number', 'Acidentes');
      data.addColumn({type: 'string', role: 'tooltip'});
      data.addRows(_.map(stats, function(d) {
        return [d.hora, d.qtd_ocorrencia, d.hora+"h: "+d.qtd_ocorrencia+" acidentes"]
      }));
      var options = { 
            colors: ['#DF5A3E'],
            width: '100%', height: '100%',
            animation: { duration: 1000 },
            backgroundColor: 'transparent',
            chartArea:{width: '80%', height: '80%', top:0},
            hAxis: { 
                baselineColor: 'transparent',
                ticks: [0,6,12,18,23], 
                gridlines: { count: 4, color: 'transparent'},
                format: '##h',
                viewWindowMode: 'maximized'
            },
            vAxis:{ 
              textPosition :'none',
              gridlines: { color: 'transparent'}
            },
            legend: { position: 'none'}                 
          };
            
        var chart = new google.visualization.ColumnChart(document.getElementById('hour'));

        chart.draw(data, options);

        $(window).resize(_.debounce(function() {
          chart.draw(data, options);
        }, 500));
    };
  }
});
  
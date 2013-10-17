define(['ko', 'underscore', 'app/views/state-view', 'data/data-finder','kartograph', 'qtip', 'goog!visualization,1,packages:[corechart]', 'chroma'], function(ko, _, stateView, dataFinder, $K, qtip) {
  var self = this;

  self.title = ko.observable("PRF");
  self.loaded = true;
  self.states = ko.observableArray();
  self.selectedState = ko.observable();
  
  self.formatNumber = function(value) {
      return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
  };

  self.stateClicked = function(state) { 
    $('#mapa').empty();
    $('.mapContainer > h3').fadeIn(500);
    $('#sideRight').fadeIn(1000);
    self.selectedState(state);
    showSeverityChart(state.bySeverity);
    showByHourChart(state.byHour);
    showMapOf(state);
  };

  var showSeverityChart = function(stats) {
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
            chartArea:{width: '90%', height: '90%',},
            legend: { position: 'none'}                 
          };
          
       var chart = new google.visualization.PieChart(document.getElementById('severity')); 
       chart.draw(data, options);
  };
     
  var showByHourChart = function(stats) {
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
          chartArea:{width: '80%', height: '80%',},
          curveType: 'function',
          hAxis: { 
                baselineColor: 'transparent',
              ticks: [0,6,12,18,23], 
              gridlines: { count: 4, color: 'transparent'}
          },
          vAxis:{ 
             
              textPosition :'none',
               gridlines: { color: 'transparent'}
          },
          legend: { position: 'none'}                 
        };
          
      var chart = new google.visualization.ColumnChart(document.getElementById('hour'));

      chart.draw(data, options);
  };

  var showMapOf = (function () {
    var map = $K.map('#mapa',600,500);
    // initialize qtip tooltip class
    $.fn.qtip.defaults.style.classes = 'ui-tooltip-bootstrap';
    
    return function (state) {
      map.loadCSS('css/map.css', function() {
        var mapPath = 'img/estados/'+ state.abbreviation +'.svg';
        map.loadMap(mapPath, function() {
          map.addLayer('vizinhos');
          map.addLayer('estado');
          map.addLayer('rodovias',{
              tooltips: function(d) {
                var title = d.rodovia + ' (km' + d['km-inicial'] + '-km' + d['km-final'] + ')',
                  details = d['qtd-acidentes'].toString() + ' acidentes';
                return [title, details];
              }
            });
          
          var colorscale = new chroma.scale('Reds').domain([0,1,2,3,4,5]);

          map.getLayer('rodovias').style('stroke', function(data) {
              return colorscale(data.categoria);
            });
        });
      });
    }; 
  })();

  return self;
});

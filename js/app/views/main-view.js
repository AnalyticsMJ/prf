define(['ko', 'underscore', 'app/views/state-view', 'data/data-finder', 'goog!visualization,1,packages:[corechart]'], function(ko, _, stateView, dataFinder) {
  var self = this;

  self.title = ko.observable("PRF");
  self.loaded = true;
  self.states = ko.observableArray();
  self.selectedState = ko.observable(null);

  console.log('ha');
  
  self.stateClicked = function(state) { 
    self.selectedState(state);
    showSeverityChart(state.bySeverity); 
    showByHourChart(state.byHour); 
  };
    
    
    showSeverityChart = function(stats) {


        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Gravidade');
        data.addColumn('number', 'Acidentes'); 
        data.addRows(_.map(stats, function(d) {
          return [d.gravidade, d.qtd_ocorrencia]
        }));
        var options = { 
              width: '100%', height: '100%',
              animation: { duration: 1000 },
              backgroundColor: 'transparent',
              chartArea:{width: '80%', height: '80%',},
               legend: { position: 'none'}                 
              };
            
         var chart = new google.visualization.PieChart(document.getElementById('severity')); 
         chart.draw(data, options);
    }


       
    showByHourChart = function(stats) {

      var data = new google.visualization.DataTable();
      data.addColumn('number', 'Hora');
      data.addColumn('number', 'Acidentes');
      data.addColumn({type: 'string', role: 'tooltip'});
      data.addRows(_.map(stats, function(d) {
        return [d.hora, d.qtd_ocorrencia, d.hora+"h: "+d.qtd_ocorrencia+" acidentes"]
      }));
      var options = { 
            width: '100%', height: '100%',
            animation: { duration: 1000 },
            backgroundColor: 'white',
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

    }
     
    


    self.loadStates = function(states) {
      selectedStateView(states);
    };

    return self;
  });

define(['ko', 'app/views/map-render', 'app/views/chart-render'], function(ko, MapRender, ChartRender) {
  var self = this,
    mapRender = new MapRender(),
    chartRender = new ChartRender();

  self.title = ko.observable("PRF");
  self.loaded = true;
  self.states = ko.observableArray();
  self.selectedState = ko.observable();
  self.selectedYear = ko.observable(2012);

  self.selectedYear.subscribe(function(newYear){
     self.yearChanged(newYear);
    });
  
  self.formatNumber = function(value) {
      return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
  };

  self.formatPercentage = function(value) {
      return Math.round(value * 100).toString() + '%';
  };

  var stateOrYearClicked = function(state, year){
    $('#mapa').empty();
    $('.mapContainer > h3').fadeIn(500);
    $('#sideRight').fadeIn(1000);
    self.selectedState(state);
    chartRender.showSeverityChart(state.bySeverity[year]);
    chartRender.showByHourChart(state.byHour[year]);
    mapRender.showMapOf(state, year);
  };

  self.stateClicked = function(state) {
    stateOrYearClicked(state, selectedYear());
  };

  self.yearChanged = function(year) {
    stateOrYearClicked(selectedState(), year);
  };


  self.iconsByVehicleType = {
    qtd_ocorrencias_bicicleta: { icon: 'img/bicycle-w100.png' },
    qtd_ocorrencias_motocicleta: { icon: 'img/motorcycle-w100.png' },
    qtd_ocorrencias_automovel: { icon: 'img/car-w100.png' },
    qtd_ocorrencias_onibus: { icon: 'img/bus-w100.png' },
    qtd_ocorrencias_caminhao: { icon: 'img/truck-w100.png' }
  }

  return self;
});

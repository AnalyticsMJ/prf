define(['ko', 'app/views/map-render', 'app/views/chart-render'], function(ko, MapRender, ChartRender) {
  var self = this,
    mapRender = new MapRender(),
    chartRender = new ChartRender();

  self.title = ko.observable("PRF");
  self.loaded = true;
  self.states = ko.observableArray();
  self.selectedState = ko.observable();
  
  self.formatNumber = function(value) {
      return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
  };

  self.formatPercentage = function(value) {
      return Math.round(value * 100).toString() + '%';
  };

  self.stateClicked = function(state) { 
    $('#mapa').empty();
    $('.mapContainer > h3').fadeIn(500);
    $('#sideRight').fadeIn(1000);
    self.selectedState(state);
    chartRender.showSeverityChart(state.bySeverity);
    chartRender.showByHourChart(state.byHour);
    mapRender.showMapOf(state, 2010);
  };

  self.vehicleTypes = [
    { icon: 'img/bicycle-w100.png', quantityPercentage: 'qtd_ocorrencias_bicicleta_percent' },
    { icon: 'img/motorcycle-w100.png', quantityPercentage: 'qtd_ocorrencias_motocicleta_percent' },
    { icon: 'img/car-w100.png', quantityPercentage: 'qtd_ocorrencias_automovel_percent' },
    { icon: 'img/bus-w100.png', quantityPercentage: 'qtd_ocorrencias_onibus_percent' },
    { icon: 'img/truck-w100.png', quantityPercentage: 'qtd_ocorrencias_caminhao_percent' }
  ];

  return self;
});

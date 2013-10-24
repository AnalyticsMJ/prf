define(['ko', 'app/views/map-render', 'app/views/chart-render'], function(ko, MapRender, ChartRender) {
  var self = this,
    mapRender = new MapRender(),
    chartRender = new ChartRender();

  self.title = ko.observable("PRF");
  self.loaded = true;
  self.states = ko.observableArray();
  self.selectedState = ko.observable();
  self.selectedYear = ko.observable(2012);
  
  self.currentByVehicleType = ko.computed(function(){
    if(!self.selectedState()) return ''
    return self.selectedState().byVehicleType[self.selectedYear()];
  });


  self.currentRank = ko.computed(function(){
    if(!self.selectedState()) return ''
    return self.selectedState().by100Thousand[self.selectedYear()].rank;
  });
  self.currentAcidentsByThousand = ko.computed(function(){
  if(!self.selectedState()) return ''
    return formatNumber(self.selectedState().by100Thousand[self.selectedYear()].acidentes_por_100_mil);
  });

  self.selectedYear.subscribe(function(newYear){
     self.yearChanged(newYear);
    });
  
  self.formatNumber = function(value) {
      return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
  };

  self.formatPercentage = function(value) {
      return value + '%';
  };

  var stateOrYearClicked = function(state, year){
    $('.mapContainer > h3').fadeIn(500);
    $('#sideRight').fadeIn(1000);
    self.selectedState(state);
    chartRender.showSeverityChart(state.bySeverity[year]);
    chartRender.showByHourChart(state.byHour[year]);   
  };

  self.stateClicked = function(state) {
    stateOrYearClicked(state, selectedYear());
    mapRender.showMapOf(state, selectedYear());
  };

  self.yearChanged = function(year) {
    stateOrYearClicked(selectedState(), year);
    mapRender.changeYear(year);
  };

  self.iconsByVehicleType = {
    qtd_ocorrencias_bicicleta: { icon: 'bike' },
    qtd_ocorrencias_motocicleta: { icon: 'motorbike' },
    qtd_ocorrencias_automovel: { icon: 'car' },
    qtd_ocorrencias_onibus: { icon: 'bus'},
    qtd_ocorrencias_caminhao: { icon: 'truck' }
  }

  return self;
});

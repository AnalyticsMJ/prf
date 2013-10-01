define(['ko', 'underscore', 'app/views/state-view', 'data/data-finder', 'nv'], function (ko, _, stateView, dataFinder) {
    var self = this;
	
	self.title = ko.observable("PRF");
	self.loaded = true;
	self.states = ko.observableArray();
	self.selectedState = ko.observable(null);
 
	self.stateClicked = function(state) {		
	    self.selectedState(state);
		showSeverityChart(state.bySeverity);
		showByHourChart(state.byHour);
	};
	
	showSeverityChart = function(data){
		
		nv.addGraph(function() {    
		    var chart = nv.models.pieChart()
		        .x(function(d) { return d.gravidade; })
		        .y(function(d) { return d.qtd_ocorrencia; })
				.showLabels(true)
				.showLegend(false)
				.tooltipContent(function(key){return '<span class="tooltip">'+key+'</span>';});
				
		      d3.select("#severity")
		          .datum([{key: "", values: data}])
		          .transition().duration(1200) 
		          .call(chart);

		    return chart;
		});
	}
	
	showByHourChart = function(data){
		nv.addGraph(function() {  
	      var chart = nv.models.lineChart()
        .x(function(d) { return d.hora; })
        .y(function(d) { return d.qtd_ocorrencia; });
	    
	      chart.xAxis
	          .axisLabel('Hora')
	          .tickFormat(d3.format(',r'));
	    
	      chart.yAxis
	          .axisLabel('Quantidade')
	          .tickFormat(d3.format('.02f'));
	    
	      d3.select('#hour')
	        .datum([{key: "", values: data, color: '#2ca02c'}])
	        .transition().duration(500)
	          .call(chart);

	  nv.utils.windowResize(function() { d3.select('#hour').call(chart) });
	    
	      return chart;
	    });
	   
		
	}
	

	self.loadStates = function(states){
		selectedStateView(states);
	};
			
	return self;
});
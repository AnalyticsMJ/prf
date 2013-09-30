define(['ko', 'underscore', 'app/views/state-view', 'data/data-finder', 'nv'], function (ko, _, stateView, dataFinder) {
    var self = this;
	
	self.title= ko.observable("PRF");
	self.loaded= true;
	self.states= ko.observableArray();
	self.selectedState=ko.observable(null);
 
	self.stateClicked= function(state) {		
	    self.selectedState(state);
		showSeverityChart(state.bySeverity)
	};
	
	showSeverityChart = function(data){
		
		
		nv.addGraph(function() {
		    

			    var chart = nv.models.pieChart()
			        .x(function(d) { return d.gravidade; })
			        .y(function(d) { return d.qtd_ocorrencia; })
					.showLabels(false)
					.showLegend(false)
					.tooltipContent(function(key){return '<span class="tooltip">'+key+'</span>';});
					
			      d3.select("#severity")
			          .datum([{key: "", values: data}])
			        .transition().duration(1200) 
			          .call(chart);

			    return chart;
		});
	}
	
	

	self.loadStates= function(states){
		selectedStateView(states);
	};
			
	return self;
});
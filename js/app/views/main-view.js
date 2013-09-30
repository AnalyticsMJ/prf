define(['ko', 'underscore', 'app/views/state-view', 'data/data-finder'], function (ko, _, stateView, dataFinder) {
    var self = this;
	
	self.title= ko.observable("PRF");
	self.loaded= true;
	self.states= ko.observableArray();
	self.selectedStatistic=ko.observable(null);
 
	self.stateClicked= function(state) {
		var statistics = dataFinder.accidentsByState(state.abbreviation);
	    self.selectedStatistic(statistics);
	};

	self.loadStates= function(states){
		selectedStateView(states);
	};
			
	return self;
});
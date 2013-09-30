define(['ko', 'underscore', 'app/views/state-view'], function (ko, _, stateView) {
    return {
        title: ko.observable("PRF"),
        loaded: true,
        states: ko.observableArray(),
        
		selectedStateView: ko.observable(),
		
        selectState: function(state) {
            selectedStateView.updateWith(state);
        },
		
		loadStates: function(states){
			selectedStateView(states);
		}
		
    };
});
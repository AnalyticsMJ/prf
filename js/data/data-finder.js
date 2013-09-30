define(['data/states', 'underscore'], function(states, _) {
    return {
        findState: function(abbreviation) {
            return _.find(states, function(e) {
                return e.abbreviation.toLowerCase() === abbreviation.toLocaleLowerCase();
            })	
        },
		allStates: function(){
			return states;
		},
		
		
    };
});
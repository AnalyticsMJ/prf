define(['data/states', 'data/acidentes-por-100-mil', 'underscore'], function(states, accidents, _) {
    return {
        findState: function(abbreviation) {
            return _.find(states, function(e) {
                return e.abbreviation.toLowerCase() === abbreviation.toLocaleLowerCase();
            })	
        },
		allStates: function(){
			return states;
		},
		accidentsByState: function(abbreviation){
			return _.find(accidents, function(accident){
				return accident.uf === abbreviation;
			})
		}
		
    };
});
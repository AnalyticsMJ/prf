require.config({
    baseUrl: "js",
    paths: {
        "jquery": ["http://code.jquery.com/jquery-1.10.2.min",
            "vendor/jquery-1.10.2.min"],
        "ko": ["http://cdnjs.cloudflare.com/ajax/libs/knockout/2.3.0/knockout-min",
            "vendor/knockout-2.3.0.min"],
        "underscore": ['http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min',
            "vendor/underscore-1.5.2.min"],
		"d3":['http://d3js.org/d3.v3.min', 'vendor/d3.v3.min'],		
		"nv":['http://nvd3.org/nv.d3', 'vendor/nv.d3.min'],
		
    },
    shim: {
        underscore: {
            exports: '_'
        },
		d3:{ exports:"d3"},
		nv:{ deps: ['d3'], exports:"nv"}
    },
    waitSeconds: 15
});

require(['ko', 'app/views/main-view', 'data/data-finder'], function(ko, mainView, dataFinder) {
    ko.applyBindings(mainView, document.getElementsByTagName('html')[0]);

    //TODO: remove this. change states by user actions
    var states = dataFinder.allStates();
    mainView.states(states);
	
});

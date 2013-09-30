require.config({
    baseUrl: "js",
    paths: {
        "jquery": ["http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min",
            "vendor/jquery-1.10.2.min"],
        "ko": ["http://cdnjs.cloudflare.com/ajax/libs/knockout/2.3.0/knockout-min",
            "vendor/knockout-2.3.0.min"],
        "underscore": ['http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min',
            "vendor/underscore-1.5.2.min"]
    },
    shim: {
        underscore: {
            exports: '_'
        }
    },
    waitSeconds: 15
});

require(['ko', 'app/views/main-view', 'data/data-finder'], function(ko, mainView, dataFinder) {
    ko.applyBindings(mainView, document.getElementsByTagName('html')[0]);

    //TODO: remove this. change states by user actions
    var states = dataFinder.allStates();
    mainView.states(states);
});

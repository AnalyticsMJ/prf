require.config({
    baseUrl: "js",
    paths: {
        jquery: ["http://code.jquery.com/jquery-1.10.2.min",
            "vendor/jquery-1.10.2.min"
        ],
        ko: ["http://cdnjs.cloudflare.com/ajax/libs/knockout/2.3.0/knockout-min",
            "vendor/knockout-2.3.0.min"
        ],
        underscore: ['http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min',
            "vendor/underscore-1.5.2.min"
        ],
        async: 'vendor/async',
        goog: 'vendor/goog',
        propertyParser: 'vendor/propertyParser',
        raphael: 'vendor/raphael-min',
        kartograph: 'vendor/kartograph.min',
        chroma: 'vendor/chroma.min'


    },
    shim: {
        underscore: {
            exports: '_'
        },
        kartograph: {
            deps: ['jquery', 'raphael','chroma'],
            exports: '$K'
        }
    },
    waitSeconds: 5
});

require(['ko', 'app/views/main-view', 'data/data-finder', 'jquery'], function(ko, mainView, dataFinder, $) {
    var init = (function () {
        var loadStates = function() {
            ko.applyBindings(mainView, document.getElementsByTagName('html')[0]);
            var states = dataFinder.allStates();
            mainView.states(states);
            return states;
        };

        var presentPageSelecting = function(state) {
            var stateListElements = $('.statesList li');
            stateListElements.on('click', 'a', function () {
                stateListElements.find('.selected').removeClass('selected');
                $(this).addClass('selected');
            });
            stateListElements.find('a').first().click();
            mainView.stateClicked(state);
        };

        return function(states) {
            var states = loadStates();
            presentPageSelecting(states[0]);
        };
    })();

    init();
});

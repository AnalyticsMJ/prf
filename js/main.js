require.config({
    baseUrl: "js",
    paths: {
        jquery: ["//code.jquery.com/jquery-1.10.2.min",
            "vendor/jquery-1.10.2.min"
        ],
        ko: ["//cdnjs.cloudflare.com/ajax/libs/knockout/2.3.0/knockout-min",
            "vendor/knockout-2.3.0.min"
        ],
        underscore: ['//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min',
            "vendor/underscore-1.5.2.min"
        ],
        async: 'vendor/async',
        goog: 'vendor/goog',
        propertyParser: 'vendor/propertyParser',
        raphael: 'vendor/raphael-min',
        kartograph: 'vendor/kartograph.min',
        chroma: 'vendor/chroma.min',
        eventie: 'vendor/eventie',
        eventEmitter: 'vendor/eventEmitter',
        imagesloaded: 'vendor/imagesloaded.min',
        qtip: ['//cdnjs.cloudflare.com/ajax/libs/qtip2/2.1.1/basic/jquery.qtip.min',
            'vendor/qtip.min']
    },
    shim: {
        underscore: {
            exports: '_'
        },
        jquery: {
            exports: '$'
        },
        kartograph: {
            deps: ['jquery', 'raphael','chroma'],
            exports: '$K'
        }
    },
    waitSeconds: 10
});

require(['ko', 'app/views/main-view', 'data/data-finder', 'jquery', 'underscore'], function(ko, mainView, dataFinder, $, _) {
    var init = (function () {
        var loadStates = function() {
            ko.applyBindings(mainView, document.getElementsByTagName('html')[0]);
            var states = dataFinder.allStates();
            mainView.states(states);
            return states;
        };

        var presentPageSelecting = function(state) {
            var stateListElements = $('.statesList li');
            stateListElements.on('click', 'a', _.debounce(function () {
                $('#isStateSelected').removeAttr('checked');
                stateListElements.find('.selected').removeClass('selected');
                $(this).addClass('selected');
            }, 800));
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

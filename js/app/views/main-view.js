define(['ko', 'app/views/state-view'], function (ko, stateView) {
    return {
        title: ko.observable("PRF"),
        loaded: true,
        stateView: stateView,

        selectState: function(state) {
            stateView.updateWith(state);
        }
    };
});
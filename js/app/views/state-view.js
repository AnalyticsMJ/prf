define(['ko'], function(ko){
    return {
        name: ko.observable(),
        abbreviation: ko.observable(),

        //TODO: state graphs and data should be accessible from here

        updateWith: function(state) {
            if (state) {
                this.name(state.name);
                this.abbreviation(state.abbreviation);
            }
        }
    };
});
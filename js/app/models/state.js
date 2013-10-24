define(function() {
    'use strict';
    return function() {
        this.name = "";
        this.abbreviation = "";
        this.population = 0;
		this.vehicleType = "";
        this.corner = "bottomleft";

        this.withName = function(name) {
            return (this.name = name || "", this);
        };

        this.withPopulation = function(population) {
            return (this.population = population || 0, this);
        };

        this.withAbbreviation = function(abbreviation) {
            return (this.abbreviation = abbreviation || "", this);
        };
		
		this.withVehicleType = function(vehicleType) {
			return (this.vehicleType = vehicleType || "", this);
		};

        this.withCorner = function(corner) {
            return (this.corner = corner || "bottomleft", this);
        };
    };
});
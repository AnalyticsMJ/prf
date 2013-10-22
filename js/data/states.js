define(['underscore', 'app/models/state', 'data/accidents-by-100-thousand', 'data/accidents-by-severity', 'data/accidents-by-hour.json', 'data/accidents-by-vehicle-type'], function(_, State, by100Thousand, bySeverity, byHour, byVehicleType) {
    var states = [];
    states.push(new State().withAbbreviation("AC").withName("Acre").withPopulation(707125));
    states.push(new State().withAbbreviation("AL").withName("Alagoas").withPopulation(3093994));
    states.push(new State().withAbbreviation("AP").withName("Amapá").withPopulation(648553));
    states.push(new State().withAbbreviation("AM").withName("Amazonas").withPopulation(3350773));
    states.push(new State().withAbbreviation("BA").withName("Bahia").withPopulation(13633969));
    states.push(new State().withAbbreviation("CE").withName("Ceará").withPopulation(8180087));
    states.push(new State().withAbbreviation("DF").withName("Distrito Federal").withPopulation(2469489));
    states.push(new State().withAbbreviation("ES").withName("Espírito Santo").withPopulation(3392775));
    states.push(new State().withAbbreviation("GO").withName("Goiás").withPopulation(5849105));
    states.push(new State().withAbbreviation("MA").withName("Maranhão").withPopulation(6424340));
    states.push(new State().withAbbreviation("MT").withName("Mato Grosso").withPopulation(3033991));
    states.push(new State().withAbbreviation("MS").withName("Mato Grosso do Sul").withPopulation(2404256));
    states.push(new State().withAbbreviation("MG").withName("Minas Gerais").withPopulation(19159260));
    states.push(new State().withAbbreviation("PA").withName("Pará").withPopulation(7443904));
    states.push(new State().withAbbreviation("PB").withName("Paraíba").withPopulation(3753633));
    states.push(new State().withAbbreviation("PR").withName("Paraná").withPopulation(10266737));
    states.push(new State().withAbbreviation("PE").withName("Pernambuco").withPopulation(8541250));
    states.push(new State().withAbbreviation("PI").withName("Piauí").withPopulation(3086448));
    states.push(new State().withAbbreviation("RJ").withName("Rio de Janeiro").withPopulation(15180636));
    states.push(new State().withAbbreviation("RN").withName("Rio Grande do Norte").withPopulation(3121451));
    states.push(new State().withAbbreviation("RS").withName("Rio Grande do Sul").withPopulation(10576758));
    states.push(new State().withAbbreviation("RO").withName("Rondônia").withPopulation(1535625));
    states.push(new State().withAbbreviation("RR").withName("Roraima").withPopulation(425398));
    states.push(new State().withAbbreviation("SC").withName("Santa Catarina").withPopulation(6178603));
    states.push(new State().withAbbreviation("SP").withName("São Paulo").withPopulation(39924091));
    states.push(new State().withAbbreviation("SE").withName("Sergipe").withPopulation(2036277));
    states.push(new State().withAbbreviation("TO").withName("Tocantins").withPopulation(1373551));


    _.each(states, function(state){
    	state.bySeverity = _.filter(bySeverity, byStateAbbreviation(state));		
    	state.by100Thousand = _.find(by100Thousand, byStateAbbreviation(state));
    	state.byHour = _.chain(byHour)
            .filter(byStateAbbreviation(state))
            .groupBy(function(data){return data.ano;})
            .value();
		state.byVehicleType = _.find(byVehicleType, byStateAbbreviation(state));
        
        var totalOccurs = totalOccursFrom(state.byVehicleType)
        generatePercentagesFor(state, totalOccurs);
    });
  
    states = _.sortBy(states, function(state){ return state.by100Thousand.rank; })

    return states;

    function byStateAbbreviation(state){
        return function(stateDate) { return stateDate.uf === state.abbreviation; };
    };

    function totalOccursFrom(state) {
        var totalOccurs = 0;
        for(var accidentsByVehicleType in state) {
            if(accidentsByVehicleType === 'uf') continue;
            totalOccurs += state[accidentsByVehicleType];
        }
        return totalOccurs;
    }

    function generatePercentagesFor(state, totalOccurs) {
        state.vehicleTypes = [];
        for(var accidentsByVehicleType in state.byVehicleType) {
            if(accidentsByVehicleType === 'uf') continue;
            state.vehicleTypes.push({
                percentage: state.byVehicleType[accidentsByVehicleType] / totalOccurs,
                type: accidentsByVehicleType
            });
        }
        state.vehicleTypes.sort(function(a, b) {
            return b.percentage - a.percentage;
        });
    }
})
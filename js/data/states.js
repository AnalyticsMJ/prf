define(['app/models/state', 'data/accidents-by-100-thousand','data/accidents-by-severity', 'underscore'], function(State, by100Thousand, bySeverity,_) {
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
    	state.by100Thousand = _.find(by100Thousand, function(stat){ return stat.uf === state.abbreviation});
    	state.bySeverity = _.find(bySeverity, function(stat){ return stat.uf === state.abbreviation});		
    });
  
    states = _.sortBy(states, function(state){ return state.by100Thousand.rank;  })


    return states;
})
define(['kartograph', 'qtip', 'chroma'], function($K, qtip) {
    return function () {
      var map = $K.map('#mapa');
      // initialize qtip tooltip class
      $.fn.qtip.defaults.style.classes = 'ui-tooltip-bootstrap';
      
      this.showMapOf = function (state, year) {
        $('#mapa').empty();
        map.loadCSS('css/map.css', function() {
          var mapPath = 'img/estados/'+ state.abbreviation +'.svg';
          map.loadMap(mapPath, function() {
            renderingOfMap(year); 
          });
        });
      };

      this.changeYear = function(year){
        map.getLayer('rodovias').remove();
        addRodovias(year);
      }

      function getQuantity(data, year){
        var qtd = data['qtd-acidentes-'+year] || 0;
        if (qtd === 'NULL') qtd = 0;
        return qtd;
      }

      function renderingOfMap(year) {
        map.addLayer('estado');
        addRodovias(year);
      }

      function addRodovias(year){
        map.addLayer('rodovias',{
          tooltips: function(d) {
            var title = d.rodovia + ' (km' + d['km-inicial'] + ' - km' + d['km-final'] + ')',
              details = getQuantity(d, year).toString() + ' acidentes';
            return [title, details];
          }
        });
        
        var colorscale = new chroma.scale('Reds').domain([0, 500], 5);

        map.getLayer('rodovias').style('stroke', function(data) {
          return colorscale(getQuantity(data, year));
        });
        map.fadeIn();

      }
    };
});
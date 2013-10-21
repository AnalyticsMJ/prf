define(['underscore', 'kartograph', 'qtip', 'chroma'], function(ko, $K, qtip) {
    return function () {
      var map = $K.map('#mapa', 600, 500);
      // initialize qtip tooltip class
      $.fn.qtip.defaults.style.classes = 'ui-tooltip-bootstrap';
      
      this.showMapOf = function (state) {
        map.loadCSS('css/map.css', function() {
          var mapPath = 'img/estados/'+ state.abbreviation +'.svg';
          map.loadMap(mapPath, renderingOfMap);
        });
      };

      function renderingOfMap() {
        map.addLayer('vizinhos');
        map.addLayer('estado');
        map.addLayer('rodovias',{
          tooltips: function(d) {
            var title = d.rodovia + ' (km' + d['km-inicial'] + ' - km' + d['km-final'] + ')',
              details = d['qtd-acidentes'].toString() + ' acidentes';
            return [title, details];
          }
        });
        
        var colorscale = new chroma.scale('Reds').domain([0,1,2,3,4,5]);

        map.getLayer('rodovias').style('stroke', function(data) {
          return colorscale(data.categoria);
        });
      }
    };
});
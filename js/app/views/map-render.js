define(['kartograph', 'qtip', 'app/models/corners', 'chroma'], function($K, qtip, corners) {
    return function () {
      var map = $K.map('#mapa'); 
      var thumbnail = $('#thumbnail');

      thumbnail.on('click', 'img', function(){
        var img = $(this);
        if(img.hasClass('zoomed')) {
          img.removeClass('zoomed');
          img.animate( {width: '60px'}, 'slow');
        } else {
          img.addClass('zoomed');
          img.animate( {width: '200px'}, 'slow');
        }
      });

      // initialize qtip tooltip class
      $.fn.qtip.defaults.style.classes = 'ui-tooltip-bootstrap';
      
      this.showMapOf = function (state, year) {
        map.clear();
        $('#legenda').css(corners[state.corner]);
        thumbnail.css(corners[thumbPositionFrom(state.corner)]) 
        var img = $("<img/>", { src:'img/thumb/thumb-' + state.abbreviation +'.svg', alt: state.name});
        thumbnail.empty().append(img); 

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

        var km = data['km-final'] - data['km-inicial']
        return  (qtd/km).toFixed(2);
      }

      function renderingOfMap(year) {
        map.addLayer('estado');
        addRodovias(year);
      }

      function addRodovias(year){
        map.addLayer('rodovias',{
          tooltips: function(d) {
            var title = d.rodovia + ' (km' + d['km-inicial'] + ' - km' + d['km-final'] + ')',
              details = getQuantity(d, year).toString() + ' acidentes por km';
            return [title, details];
          }
        });
        
        var colorscale = new chroma.scale('Reds').domain([0, .5, 1, 5, 10, 25, 50]);

        map.getLayer('rodovias').style('stroke', function(data) {
          return colorscale(getQuantity(data, year));
        });
        map.fadeIn();
      }

      function thumbPositionFrom(corner){
        return corner == 'bottomleft'? 'bottomright' : 'bottomleft'
      }
    };
});
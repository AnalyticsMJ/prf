define(['jquery', 'app/models/corners'], function($, corners) {
    var self = this;
    var thumbnail = $('#thumbnail');

    thumbnail.on('click', 'img', function() {
        var img = $(this);
        if (img.hasClass('zoomed')) {
            img.removeClass('zoomed');
            img.animate({
                width: '60px'
            }, 'slow');
        } else {
            img.addClass('zoomed');
            img.animate({
                width: '200px'
            }, 'slow');
        }
    });

    self.render = function(state) {
        thumbnail.css(getThumnailCornerFor(corners, state.corner))
        var img = $("<img/>", {
            src: 'img/thumb/thumb-' + state.abbreviation + '.svg',
            alt: state.name
        });
        thumbnail.empty().append(img);
    };

    var getThumnailCornerFor = function(corners, key) {
        return key == 'bottomleft' ? corners.get('bottomright') : corners.get('bottomleft');
    }

    return self;
});
(function() {
    var method;
    var noop = function () {};
    var methods = [
        'assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
        'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
        'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
        'timeStamp', 'trace', 'warn'
    ];
    var length = methods.length;
    var console = (window.console = window.console || {});

    while (length--) {
        method = methods[length];
        // Only stub undefined methods.
        if (!console[method]) 
            console[method] = noop;
    }
}());
(function(context) {
    'use strict';
    context.formatNumber = function(value) {
        return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    };
    context.formatPercentage = function(value) {
        return value + '%';
    };
    context.iconsByVehicleType = {
        qtd_ocorrencias_bicicleta: { icon: 'bike' },
        qtd_ocorrencias_motocicleta: { icon: 'motorbike' },
        qtd_ocorrencias_automovel: { icon: 'car' },
        qtd_ocorrencias_onibus: { icon: 'bus'},
        qtd_ocorrencias_caminhao: { icon: 'truck' }
    };
})(this);
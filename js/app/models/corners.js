define([], function() {
  return {
  	"topleft":     {top:"3em", left:"1.3em", bottom: "auto",  right: "auto"},
  	"bottomleft":  {top:"auto",  left:"1.3em", bottom: "0", right: "auto"},
  	"topright":    {top:"0", left:"auto",  bottom: "auto",  right: "1.3em"},
  	"bottomright": {top:"auto",  left:"auto",  bottom: "0", right: "1.3em"},
    
    get: function(key) {
      return this[key];
    }
  };
});
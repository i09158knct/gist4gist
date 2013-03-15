(function() {

  define('html-builder', ['showdown'], function(Showdown) {
    var converter;
    converter = new Showdown.converter;
    return function(text) {
      return converter.makeHtml(text);
    };
  });

}).call(this);
